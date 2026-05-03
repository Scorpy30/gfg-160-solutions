$name = Read-Host "Problem name"
$topic = Read-Host "Topic (arrays/dp/graphs/etc)"
$ext = Read-Host "File extension (java/cpp/py)"

$filename = ($name -replace ' ', '_') -replace '[^a-zA-Z0-9_]', ''
$filename = "$filename.$ext"

$folder = ".\$topic"
New-Item -ItemType Directory -Force -Path $folder | Out-Null

$filepath = "$folder\$filename"

Write-Host "Paste your code. Type END on a new line to finish:"
$code = ""
while ($true) {
    $line = Read-Host
    if ($line -eq "END") { break }
    $code += $line + "`n"
}

Set-Content -Path $filepath -Value $code

# Format entry
$entry = "| $name | $topic | $ext |"

# If README doesn't have table, create it
if (!(Test-Path "README.md") -or !(Select-String -Path "README.md" -Pattern "\| Problem \|")) {
    "# GFG 160 Solutions`n`n| Problem | Topic | Language |`n|--------|------|----------|" | Set-Content README.md
}

# Append new entry
Add-Content README.md "`n$entry"

git add .
git commit -m "Add GFG: $name"
git pull --rebase origin main
git push

Write-Host "Done → $filepath"