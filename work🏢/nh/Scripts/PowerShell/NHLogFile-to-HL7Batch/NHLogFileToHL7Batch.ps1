$script:folderpath = "\\nhbackup01\Rhapsody Logs\Master\2021\202106"
#$script:infilePrefix = "CP.tcp_IPM_ADT_to_MedTasker_OI_"
#$script:outFolder = "D:\temp\iPM_ADT_to_Medtasker"
$script:infilePrefix = "CP.tcp_EDIS_ADT_to_IPM_OI_"
$script:outFolder = "D:\temp\EDIS_ADT_to_iPM\"

$script:infileDay = [int]($_.Name.Substring(6,2));
$script:datefolderNames = $(Get-ChildItem -Path $folderpath | Where { $infileDay -lt 23 }).Name

Function script:GetMessageType {
    Param ([string] $line)

    $fields = $line.Split('|');
        
    if ($fields.Length -gt 8) { return $fields[8]; }

    return "";
}

Function script:ProcessFile {
    Param ([string] $folderpath, [string] $datefolderName)
    
    $filepath = $folderpath + '\' + $datefolderName + '\' + $infilePrefix + $datefolderName + '.txt'
    "Processing file: " + $filepath

    $outFilePath = $outFolder + '\' + $datefolderName + '.hl7'
    "into file:       " + $outFilePath
    ''

    Add-Content -Path $outFilePath -Value "FHS|^~\&|`nBHS|^~\&|"
    
    $msgType = "";
    $IsAck = $False;

    $lines = Get-Content -Path  $filepath;

    foreach ($line in $lines) {
        if ($line.StartsWith("MSH")) { 
            $msgType = GetMessageType($line);
            $IsAck = $msgType.StartsWith("ACK");
        }
        if ($IsAck) { continue; }

        $IsComment = $line.StartsWith(" =");
        if ($IsComment) { continue; }

        Add-Content -Path $outFilePath -Value $line
    }
}

foreach ($datefolderName in $datefolderNames) {
    ProcessFile $folderpath $datefolderName
}
