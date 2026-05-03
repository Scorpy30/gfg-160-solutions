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

git add $filepath
git commit -m "Add GFG: $name"
git pull --rebase origin main
git push

Write-Host "Done → $filepath"