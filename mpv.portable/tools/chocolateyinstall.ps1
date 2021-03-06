﻿$packageName = 'mpv.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '{{PackageVersion}}'
$version = $version.Replace(".","")
$url = "https://mpv.srsfckn.biz/mpv-i686-$version.7z"
$url64 = "https://mpv.srsfckn.biz/mpv-x86_64-$version.7z"

# Enable TLS 1.2 manually. Someone remind me to remove this bit when Chocolatey 0.9.11 is released
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls12'

Install-ChocolateyZipPackage $packageName $url $toolsDir $url64

# mpv can't be shimmed, the shim doesn't work with mpv.com
# as of 2016.01.18, there is a dll dependency, so mpv can't be hardlinked to chocolatey\bin
# adding to PATH until chocolatey implements a /usr/lib equivalent
$pathType = 'User'
if ( ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
	[Security.Principal.WindowsBuiltInRole] "Administrator") ) {
	$pathType = 'Machine'
}
Install-ChocolateyPath $toolsDir $pathType -ErrorAction SilentlyContinue
