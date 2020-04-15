# this is not a functioning migration script

$DebugPreference = "Continue"

$source = $(".\old-blog-temp\")
$destination = $(".\_posts\")
# $file = ("\article.text.txt")

# Get-ChildItem $source -Filter *.txt -Recurse | Rename-Item -NewName { $_.Directory.Name + ".md" }
# Get-ChildItem $source -Filter *.md -Recurse | Rename-Item -NewName { "article.text.txt" }
Get-ChildItem -Recurse $source -Filter *.txt | ForEach-Object {
    $newfilename = $_.Directory.Name + ".md" -replace '([0-9]{4})([0-9]{2})([0-9]{2})', '$1-$2-$3'
    Write-Debug ("Old Filename:    " + $_.FullName)
    Write-Debug ("Post Title:      " + $_.Directory.Name)
    Write-Debug ("New Filename:    " + $destination + $newfilename)
    Write-Debug ("--- ---")
    $filecontents_orig = (Get-Content $_.FullName -Raw) | Foreach-Object {
        $_ -replace "^", "---`r`nlayout: post`r`n" `
           -replace "(?ms)`r`n[\-]{4}", "" `
           -replace "(?ms)^Author:", "author:" `
           -replace "(?ms)^Date:", "date:" `
           -replace "(?ms)^Title:", "title:" `
           -replace "(?ms)^Description:", "description:" `
           -replace "(?ms)^Tags:", "tags:" `
           -replace "(?ms)^Text:", "---" `
           -replace "`nSlug:.*", ""
        }
    Write-Debug ("Modified File Contents: " + $filecontents_orig)
    Write-Debug ("--- ---")
    # Copy-Item -Path $_.FullName -Destination $($destination + $_.Directory.Name + ".md")
}

<# $original_file = 'path\filename.abc'
$destination_file =  'path\filename.abc.new'
(Get-Content $original_file) | Foreach-Object {
    $_ -replace 'something1', 'something1aa' `
       -replace 'something2', 'something2bb' `
       -replace 'something3', 'something3cc' `
       -replace 'something4', 'something4dd' `
       -replace 'something5', 'something5dsf' `
       -replace 'something6', 'something6dfsfds'
    } | Set-Content $destination_file #>


<# $masterfile = $("master.txt")
Set-Content -Path $masterfile "master list of files"
Get-ChildItem -Recurse -File -Exclude $masterfile -Filter *.txt | ForEach-Object {
    $filecontents = Get-Content $_.FullName
    Add-Content -Path $masterfile $($_.FullName + ", " + $filecontents)
} #>