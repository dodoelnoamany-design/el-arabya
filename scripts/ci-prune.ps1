<#
  CI prune script — remove large/unnecessary files and directories
  Keeps source files and required build scripts. Run on CI runner to reduce archive size.
#>
$ErrorActionPreference = 'Continue'

Write-Host "Pruning workspace for CI build..."

$toRemove = @(
  'dist-electron',
  'release',
  'build',
  'dist',
  'al-arabia-inventory-installer-final',
  'node_modules',
  'elnoamany_ - العربية للمخازن Pro Setup 4.0.0.exe.blockmap',
  '*.exe',
  '*.zip'
)

foreach ($p in $toRemove) {
  try {
    Write-Host "Attempting to remove: $p"
    Get-ChildItem -Path $p -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  } catch {
    # ignore
  }
}

Write-Host "Prune complete."
