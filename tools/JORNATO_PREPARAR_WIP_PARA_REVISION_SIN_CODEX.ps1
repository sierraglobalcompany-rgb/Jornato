# Jornato: prepara una copia REVISABLE de fuentes locales sin Codex ni GitHub Actions.
# IMPORTANTE: los filtros son preventivos, NO garantizan anonimización.
# NO adjuntar el ZIP antes de abrirlo y revisar archivos, rutas y contenido.
[CmdletBinding()]
param(
    [string]$Origen = 'D:\codex\Jornato',
    [string]$Salida = 'D:\codex\_REPORTES\Jornato'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Origen -PathType Container)) {
    throw "No existe el directorio de origen: $Origen"
}
$root = (Resolve-Path -LiteralPath $Origen).ProviderPath.TrimEnd('\', '/')
if (-not (Test-Path -LiteralPath $Salida -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $Salida | Out-Null
}
$output = (Resolve-Path -LiteralPath $Salida).ProviderPath.TrimEnd('\', '/')
if ($output.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase) -or
    [string]::Equals($output, $root, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'El directorio de salida debe estar FUERA del proyecto.'
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$stage = Join-Path $env:TEMP ('JOR_FUENTES_REVISION_' + [guid]::NewGuid().ToString('N'))
$zip = Join-Path $output ("JOR-WIP-PARA-REVISION-$stamp.zip")
$excludeDirs = @(
    '.git', '.dart_tool', '.gradle', '.idea', '.vscode', '.vs', '.venv',
    'node_modules', 'vendor', 'build', 'dist', 'coverage', 'storage',
    'cache', 'caches', 'tmp', 'temp', 'logs', 'log', 'data', 'datadir',
    'backups', 'backup', 'uploads', 'secrets', '_REPORTES',
    '.next', '.nuxt', '__pycache__', '.pytest_cache', 'fixtures-real'
)
$extensions = @(
    '.dart', '.php', '.kt', '.java', '.js', '.jsx', '.ts', '.tsx',
    '.yaml', '.yml', '.xml', '.gradle', '.css', '.scss', '.html', '.md'
)
$safeNames = @('pubspec.lock', 'composer.json', 'composer.lock', 'package.json',
               'package-lock.json', 'analysis_options.yaml', '.gitignore')
$dangerousName = '(?i)(^\.env($|\.)|secret|credential|password|(^|[._-])private([._-]|$)|service.account|google.services|firebase|keystore|\.key$|\.pem$|\.jks$|\.p12$|\.pfx$|\.db$|\.sqlite|\.bak$|\.dump$|^phpunit\.xml|^docker.compose|^docker-compose|^gradle\.properties)'
$secretText = '(?im)^\s*(?:APP_KEY|DB_PASSWORD|AWS_SECRET_ACCESS_KEY|ACCESS_TOKEN|REFRESH_TOKEN|PRIVATE_KEY|SECRET_KEY|MAIL_PASSWORD|JWT_SECRET|STORE_PASSWORD)\s*[:=]'
$privateKeyText = '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----'
$maxBytes = 1024 * 1024

$included = New-Object 'System.Collections.Generic.List[object]'
$skipped = New-Object 'System.Collections.Generic.List[object]'
$stack = New-Object 'System.Collections.Generic.Stack[string]'
$stack.Push($root)
New-Item -ItemType Directory -Force -Path $stage | Out-Null

try {
    while ($stack.Count -gt 0) {
        $dir = $stack.Pop()
        foreach ($item in (Get-ChildItem -LiteralPath $dir -Force)) {
            # Nunca seguir un junction/symlink a datos externos al proyecto.
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { continue }
            if ($item.PSIsContainer) {
                if ($excludeDirs -notcontains $item.Name) { $stack.Push($item.FullName) }
                continue
            }
            $rel = $item.FullName.Substring($root.Length).TrimStart('\', '/')
            $relNormal = $rel.Replace('\', '/')
            $ext = [IO.Path]::GetExtension($item.Name).ToLowerInvariant()
            if (($extensions -notcontains $ext) -and ($safeNames -notcontains $item.Name)) { continue }
            if (($item.Name -match $dangerousName) -or
                ($relNormal -match '(?i)(^|/)(cv|hojas.de.vida|personal.data|production|prod.secrets|real.data|documentos.personales)(/|$)')) {
                $skipped.Add([pscustomobject]@{ Archivo = $rel; Motivo = 'Ruta/nombre sensible' })
                continue
            }
            if ($item.Length -gt $maxBytes) {
                $skipped.Add([pscustomobject]@{ Archivo = $rel; Motivo = 'Mayor a 1 MiB' })
                continue
            }
            try {
                $body = [IO.File]::ReadAllText($item.FullName, [Text.Encoding]::UTF8)
                if (($body.IndexOf([char]0) -ge 0) -or
                    ($body -match $privateKeyText) -or ($body -match $secretText)) {
                    $skipped.Add([pscustomobject]@{ Archivo = $rel; Motivo = 'Contenido potencialmente sensible' })
                    continue
                }
                $destination = Join-Path $stage $rel
                $parent = Split-Path -Path $destination -Parent
                New-Item -ItemType Directory -Force -Path $parent | Out-Null
                [IO.File]::Copy($item.FullName, $destination, $false)
                $hash = (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
                $included.Add([pscustomobject]@{ Archivo = $rel; Bytes = $item.Length; SHA256 = $hash })
            } catch {
                $skipped.Add([pscustomobject]@{ Archivo = $rel; Motivo = 'Error al leer/copiar' })
            }
        }
    }

    if ($included.Count -eq 0) {
        throw 'No se encontraron archivos fuente exportables; no se crea un ZIP vacío.'
    }

    $review = @"
JORNATO — ARCHIVOS PARA REVISIÓN MANUAL (NO SUBIDOS)
Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
Origen: $root
Incluidos: $($included.Count)
Omitidos por riesgo/error/tamaño: $($skipped.Count)

ATENCIÓN: Este filtro NO GARANTIZA la ausencia de secretos ni datos personales
incrustados en el código. Revise manualmente el ZIP, los .php/.dart/.js,
las rutas y los CSV antes de adjuntarlo a un chat.
NO envíe .env, contraseñas, tokens, llaves, bases de datos, CV, documentos
laborales, selfies, datos de empleados ni carpetas completas de storage.
El script no lee ni modifica el repositorio Git ni envía datos por red.
No publica en GitHub, no hace merge y no ejecuta pruebas.
"@
    Set-Content -LiteralPath (Join-Path $stage 'REVISAR_ANTES_DE_COMPARTIR.txt') -Value $review -Encoding UTF8
    $included | Export-Csv -LiteralPath (Join-Path $stage 'ARCHIVOS_INCLUIDOS.csv') -NoTypeInformation -Encoding UTF8
    $skipped | Export-Csv -LiteralPath (Join-Path $stage 'ARCHIVOS_OMITIDOS.csv') -NoTypeInformation -Encoding UTF8

    Write-Host "Se seleccionaron $($included.Count) archivos de código y se omitieron $($skipped.Count) riesgos/errores." -ForegroundColor Yellow
    Write-Host 'El ZIP podría contener datos sensibles no detectados. Revise manualmente antes de compartir.' -ForegroundColor Yellow
    $confirm = Read-Host 'Para crear el ZIP local escriba exactamente EXPORTAR'
    if ($confirm -cne 'EXPORTAR') {
        Write-Host 'Cancelado. El origen permanece sin cambios.'
        return
    }
    Compress-Archive -Path (Join-Path $stage '*') -DestinationPath $zip -CompressionLevel Optimal
    $zipHash = (Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash
    Write-Host "ZIP LOCAL (REQUIERE REVISIÓN): $zip" -ForegroundColor Green
    Write-Host "SHA-256: $zipHash"
    Write-Host 'Abra el ZIP, revise el contenido y elimine cualquier archivo confidencial ANTES de adjuntarlo.' -ForegroundColor Yellow
} finally {
    if (Test-Path -LiteralPath $stage) {
        Remove-Item -LiteralPath $stage -Force -Recurse
    }
}
