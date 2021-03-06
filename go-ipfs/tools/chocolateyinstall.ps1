﻿$packageName= 'go-ipfs'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '{{PackageVersion}}'
$url        = "http://dist.ipfs.io/go-ipfs/v${version}/go-ipfs_v${version}_windows-386.zip"
$url64      = "http://dist.ipfs.io/go-ipfs/v${version}/go-ipfs_v${version}_windows-amd64.zip"

Install-ChocolateyZipPackage $packageName $url $toolsDir $url64
