$limit = (Get-Date).AddDays(-14)
$path = "C:\Users\krc\Dokumenty\Temp"

# Delete all files in the root and subfolders older than $limit
Get-ChildItem -Path $path -File -Recurse | where { $_.LastWriteTime -lt $limit | Remove-Item

# Get first-level subfolders in the root directory
$firstLevelSubfolders = Get-ChildItem -Path $path -Directory

# Delete all subfolders within the first-level subfolders older than $limit
foreach ($folder in $firstLevelSubfolders) {
    Get-ChildItem -Path $folder.FullName -Directory -Recurse | where { $_.LastWriteTime -lt $limit } | Remove-Item -Recurse -Force
}
