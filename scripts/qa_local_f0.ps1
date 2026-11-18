# QA manual del prototipo REMOTO F0 de Jornato, sin Codex ni Actions.
# Uso en un CLON SEPARADO Y LIMPIO de PR #3:
#   powershell -NoProfile -File .\scripts\qa_local_f0.ps1
# Opcional, sólo si ya existe andamiaje Android: -ApkDebug
# No usar sobre D:\codex\Jornato con WIP no publicado.
[CmdletBinding()]
param(
    [switch]$ApkDebug,
    [string]$ReportDir = (Join-Path $env:TEMP 'JORNATO_F0_QA')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).ProviderPath
foreach ($required in @('pubspec.yaml', 'lib\src\domain\attendance.dart',
                          'tool\smoke_attendance.dart', '.git')) {
    if (-not (Test-Path -LiteralPath (Join-Path $repo $required))) {
        throw "Falta archivo requerido del clon F0: $required"
    }
}

$gitCmd = (Get-Command git -ErrorAction Stop).Source
$head = (& $gitCmd -C $repo rev-parse HEAD).Trim()
if ($LASTEXITCODE -ne 0) { throw 'No se pudo determinar HEAD' }
$branch = (& $gitCmd -C $repo branch --show-current).Trim()
if ($LASTEXITCODE -ne 0) { throw 'No se pudo determinar rama' }
if ($branch -cne 'feat/jornato-f0-archive-shifts-no-ci-20261117') {
    throw "Rama incorrecta: $branch. Usar un CLON limpio del PR #3, no WIP."
}
$dirty = @(& $gitCmd -C $repo status --porcelain --untracked-files=all)
if ($LASTEXITCODE -ne 0 -or $dirty.Count -gt 0) {
    throw 'El clon no está limpio; el QA no debe alterar un WIP existente.'
}

$flutterCmd = (Get-Command flutter -ErrorAction Stop).Source
$flutterBin = Split-Path -Path $flutterCmd -Parent
$dartPath = Join-Path $flutterBin 'cache\dart-sdk\bin\dart.exe'
if (-not (Test-Path -LiteralPath $dartPath)) {
    $dartPath = (Get-Command dart -ErrorAction Stop).Source
}
if (-not (Test-Path -LiteralPath $ReportDir -PathType Container)) {
    New-Item -ItemType Directory -Path $ReportDir -Force | Out-Null
}
$reportRoot = (Resolve-Path -LiteralPath $ReportDir).ProviderPath
if ($reportRoot.StartsWith($repo + '\',
        [StringComparison]::OrdinalIgnoreCase) -or
    [string]::Equals($reportRoot, $repo,
        [StringComparison]::OrdinalIgnoreCase)) {
    throw 'La carpeta de reportes debe quedar FUERA del repositorio.'
}
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $reportRoot ("JOR-F0-LOCAL-QA-$stamp.log")
$summary = Join-Path $reportRoot ("JOR-F0-LOCAL-QA-$stamp.txt")
$result = 'FAIL'
$reason = ''
$transcribing = $false

function Run-Step {
    param(
        [string]$Label,
        [string]$Executable,
        [string[]]$Arguments
    )
    Write-Host ""
    Write-Host ("[QA] " + $Label) -ForegroundColor Cyan
    & $Executable @Arguments
    $status = $LASTEXITCODE
    if ($status -ne 0) {
        throw ("Falló " + $Label + " (exit " + $status + ")")
    }
}

Push-Location $repo
try {
    Start-Transcript -Path $log -Force | Out-Null
    $transcribing = $true
    Write-Host "JORNATO F0 QA · HEAD $head · BRANCH $branch"
    Write-Host "Solo clon limpio. No GitHub Actions, Docker, Codex ni datos reales."
    Run-Step -Label 'Versión de Flutter' -Executable $flutterCmd -Arguments @('--version')
    Run-Step -Label 'Versión de Dart' -Executable $dartPath -Arguments @('--version')
    Run-Step -Label 'Smoke de dominio Dart puro' -Executable $dartPath -Arguments @('tool/smoke_attendance.dart')
    Run-Step -Label 'Obtener dependencias sólo de caché local' -Executable $flutterCmd -Arguments @('pub','get','--offline')
    Run-Step -Label 'Análisis estático Flutter' -Executable $flutterCmd -Arguments @('analyze','--no-pub')
    Run-Step -Label 'Pruebas Flutter' -Executable $flutterCmd -Arguments @('test','--no-pub','--reporter','expanded','test')
    if ($ApkDebug) {
        if (-not (Test-Path -LiteralPath (Join-Path $repo 'android') -PathType Container)) {
            throw 'Android BLOCKED: falta scaffolding. No se ejecuta flutter create automáticamente.'
        }
        Run-Step -Label 'APK debug opcional' -Executable $flutterCmd -Arguments @('build','apk','--debug','--no-pub')
    }
    $result = 'PASS'
} catch {
    $reason = $_.Exception.Message
    Write-Host "QA FALLÓ O BLOQUEADO: $reason" -ForegroundColor Red
} finally {
    Pop-Location
    if ($transcribing) { Stop-Transcript | Out-Null }
    $afterHead = (& $gitCmd -C $repo rev-parse HEAD).Trim()
    $afterStage = @(& $gitCmd -C $repo diff --cached --name-only)
    $final = @(
        "TASK=JOR-F0-LOCAL-QA"
        "STATUS=$result"
        "SOURCE_HEAD=$head"
        "HEAD_UNCHANGED=$([string]($afterHead -eq $head))"
        "INDEX_STAGED_ENTRIES=$($afterStage.Count)"
        "APK_REQUESTED=$([string]([bool]$ApkDebug))"
        "REASON=$reason"
        "LOG=$log"
        "ANDROID_REAL=NOT_RUN"
        "SQLCIPHER=NOT_RUN"
        "BACKEND=NOT_RUN"
        "RELEASE=NO_GO"
    )
    $final | Set-Content -LiteralPath $summary -Encoding UTF8
    Write-Host ($final -join [Environment]::NewLine)
    Write-Host "Informe local: $summary"
}
if ($result -ne 'PASS') { exit 1 }
