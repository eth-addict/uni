# Array of your Ethereum wallet addresses (these were randomly pulled from the CSV as examples)
$my_addr = @(
'0x16FaFa19DE50cC551F2BC755E05cea1A6e83C17A',
'0x2769d5396E396F74eBA656CFE1DD0a4f2C8f8b0B',
'0x5D502D8928Ac13b7700Ab602db35fBb6a95eDaf6',
'0xB2b55f31c426fe16525e851fd9f289876Ba2883c',
'0xFF800d38664b546E9a0b7a72af802137629d4f11',
'0xa73c535039a42ad03cc922e4Ca643f6e0b70be16',
'0xd151101888Bd9B5B666A8562A985CCb6ad265a3d'
)

# Alternatively, just import a text file with one address per line
# $my_addr = Get-Content .\my_addr.txt

# Download the ~16mb Uniswap distribution master list CSV file to disk
$localPath = $env:TMP + "\uniswap-distribution.csv"
if(!(Test-Path $localPath)){
    # Thanks to /u/xbiitx for the CSV link!
    $csv_path = "https://raw.githubusercontent.com/banteg/uniswap-distribution/master/uniswap-distribution.csv"
    $wc = New-Object System.Net.Webclient
    $wc.DownloadFile($csv_path, $localPath)
}

# Import CSV and search for matches
Import-Csv $localPath | ?{$my_addr -match $_.address} | ft address,uni