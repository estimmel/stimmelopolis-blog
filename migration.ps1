# this is not a functioning migration script

$DebugPreference = "Continue"

$source = $(".\old-blog-temp\")
$destination = $(".\_posts\")
# $file = ("\article.text.txt")

# Get-ChildItem $source -Filter *.txt -Recurse | Rename-Item -NewName { $_.Directory.Name + ".md" }
# Get-ChildItem $source -Filter *.md -Recurse | Rename-Item -NewName { "article.text.txt" }
Get-ChildItem -Recurse $source -Filter *.txt | ForEach-Object {
    #Select-String
    $newfilename = $_.Directory.Name + ".md" -replace '([0-9]{4})([0-9]{2})([0-9]{2})', '$1-$2-$3'
    #$filecontents = Get-Content $_.FullName.ToString() -replace '[\-]{4}', ''
    Write-Debug ("Old Filename:    " + $_.FullName)
    Write-Debug ("Post Title:      " + $_.Directory.Name)
    Write-Debug ("New Filename:    " + $destination + $newfilename)
    Write-Debug ("--- ---")
    $filecontents_orig = Get-Content -Raw $_.FullName
    $filecontents_orig | Select-String '\n[\-]{4}' -AllMatches | Foreach { # regex replacement in file contents not working yet
        $_.Matches
    }
    Write-Debug ("--- ---")
    # Copy-Item -Path $_.FullName -Destination $($destination + $_.Directory.Name + ".md")
}

<# $masterfile = $("master.txt")
Set-Content -Path $masterfile "master list of files"
Get-ChildItem -Recurse -File -Exclude $masterfile -Filter *.txt | ForEach-Object {
    $filecontents = Get-Content $_.FullName
    Add-Content -Path $masterfile $($_.FullName + ", " + $filecontents)
} #>