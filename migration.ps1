# This script converts Kirby formatted blog posts to Jekyll formatted blog posts
# and moves them to a new folder.

# Uncomment the row below if debugging
# $DebugPreference = "Continue"

$source = $(".\old-blog-temp\")
$destination = $(".\_posts\")

Get-ChildItem -Recurse $source -Filter *.txt | ForEach-Object {
    $newfile = $_.Directory.Name + ".md" -replace '([0-9]{4})([0-9]{2})([0-9]{2})', '$1-$2-$3'
    # Write-Debug ("Old Filename:    " + $_.FullName)
    # Write-Debug ("Post Title:      " + $_.Directory.Name)
    # Write-Debug ("New Filename:    " + $destination + $newfile)
    (Get-Content $_.FullName -Raw) | Foreach-Object {
        $_ -replace "^", "---`r`nlayout: post`r`n" `
           -replace "(?ms)`r`n[\-]{4}", "" `
           -replace "(?ms)^Author:", "author:" `
           -replace "(?ms)^Date:", "date:" `
           -replace "(?ms)^Title:", "title:" `
           -replace "(?ms)^Description:", "description:" `
           -replace "(?ms)^Tags:", "tags:" `
           -replace "(?ms)^Text:", "---" `
           -replace "`nSlug:.*", ""
        } | Set-Content ($destination + $newfile)
    # Write-Debug ("--- --- ---")
}