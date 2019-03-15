######Simple multi-host network connectivity test
######Author: Jarrett Allman
######Date: 3/15/2019


###Specify CSV source for network list in format name,ip
$netlist = Import-CSV nettest.csv

###Get Date for file name
$DateFileName = Get-Date -format "dd-MM-yyyy@HH-mm-ss"

###Write site name and run test-netconnection for each entry in CSV
$output =
    ForEach($network in $netlist)
        {
        $name = $network.name
        $ip = $network.ip
        Write-Output ==============$name==============;
        Test-NetConnection -ComputerName $ip -InformationLevel Detailed
        }

###Output results to txt file
$output | Out-File "NetTest_$DateFileName.txt"
Invoke-Item "NetTest_$DateFileName.txt"
