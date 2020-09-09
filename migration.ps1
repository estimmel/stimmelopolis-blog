# This script converts Kirby formatted blog posts to Jekyll formatted blog posts
# and moves them to a Jekyll folder structure. Heavily customized to address Stimmelopolis Blog

# Uncomment the row below if debugging
$DebugPreference = "Continue"

$source = $(".\old-blog-temp\")
$destination = $(".\_posts\")

# copy all the images to the right folders
Get-ChildItem -Recurse $source -Filter *.jpg | ForEach-Object {
    $newimage = $(".\images\posts\" + $_.Directory.Name + "\" + $_.Name)
    Write-Debug ("Source Image:   " + $_.FullName)
    Write-Debug ("New Image:      " + $newimage)
    New-Item -ItemType File -Path $newimage -Force
    Copy-Item $_.FullName -Destination $newimage -Force
}

# copy all the blog text files
Get-ChildItem -Recurse $source -Filter *.txt | ForEach-Object {
    $newfile = $_.Directory.Name + ".md" -replace '([0-9]{4})([0-9]{2})([0-9]{2})', '$1-$2-$3'
    Write-Debug ("Old Filename:    " + $_.FullName)
    Write-Debug ("Post Title:      " + $_.Directory.Name)
    Write-Debug ("New Filename:    " + $destination + $newfile)
    (Get-Content $_.FullName -Raw) | Foreach-Object {
        $_ -replace "^", "---`r`nlayout: post`r`n" `
           -replace "(?ms)`r`n[\-]{4}", "" `
           -replace "(?ms)^Author:", "author:" `
           -replace "(?ms)^Date:", "date:" `
           -replace "(?ms)^Title:", "title:" `
           -replace "(?ms)^Description:", "description:" `
           -replace "(?ms)^Tags:", "tags:" `
           -replace "(?ms)^Text:", "---" `
           -replace "`nSlug:.*", "" `
           -replace '\(image:\s(.*?)\.jpg.*?link:\s(.*?\.jpg)\)', '![$1](.\images\posts\--path--\$2)'
           # line above, need to figure out how to put $_.Directory.Name where '--path--' is...
           # possibly something like this https://stackoverflow.com/questions/40682650/renaming-files-by-reformatting-existing-filenames-placeholders-in-replacement/40683667#40683667
        } | Set-Content ($destination + $newfile)
    Write-Debug ("--- --- ---")
}