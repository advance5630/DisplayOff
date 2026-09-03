$pngPath = Join-Path $PSScriptRoot 'monitor-off.png'
$icoPath = Join-Path $PSScriptRoot 'monitor-off.ico'
$png = [IO.File]::ReadAllBytes($pngPath)

# ICO with a PNG payload; Explorer and the .NET apphost both recognize this format.
$header = [byte[]](0, 0, 1, 0, 1, 0)
$offset = 22
$length = $png.Length
$entry = [byte[]](
    0, 0, 0, 0,
    1, 0,
    32, 0,
    ($length -band 0xff), (($length -shr 8) -band 0xff), (($length -shr 16) -band 0xff), (($length -shr 24) -band 0xff),
    ($offset -band 0xff), (($offset -shr 8) -band 0xff), (($offset -shr 16) -band 0xff), (($offset -shr 24) -band 0xff)
)
[IO.File]::WriteAllBytes($icoPath, $header + $entry + $png)
