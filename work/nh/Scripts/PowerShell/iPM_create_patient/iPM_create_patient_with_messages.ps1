# Build messages for iPM to create patients - As iPM only accepts visit messages from EDIS, need to send A04 admit message to create the patient, then A03 to discharge the patient and close the ED episode

$Script:start_ur = 6000131
$Script:number_of_patients = 10
$Script:out_dir_path = 'c:/temp/'
$script:out_report_file = join-path $out_dir_path "patients_list.csv"

$script:languages = @("2201^Greek","1201^English","4202^Arabic","4301^Turkish","2401^Italian")

ECHO "NH UR,DOB,Language,Mobile,email,CPF Episode ID" > $out_report_file

for ($local:i = 1; $i -le $number_of_patients; $i++) {
	$local:ur = $start_ur + $i - 1
	$local:pt_suffix = $ur % 100
	$local:phone = '33334444'
	$local:mobile = '0416944803'
	$local:email = 'deanna@theclinician.com'
	$local:dob = "$(Get-Random -Minimum 1970 -Maximum 1999)$((Get-Random -Minimum 1 -Maximum 12).ToString().padleft(2,'0'))$((Get-Random -Minimum 1 -Maximum 28).ToString().padleft(2,'0'))"
	$local:language = $languages[($i - 1) % 5]
	
	ECHO "MSH|^~\&|EDIS|1280|HSIE|1280|20221220080000||ADT^A04|12720656_$($i)|V|2.4|||AL|NE||ASCII`rEVN|A04|20221220080000`rPID|||$($ur)^^^^MR^1280~4545454545^^^AUSHIC^MC^^20221221||TestZedoc$($pt_suffix)^ZdTest^TZ$($pt_suffix)^^MRS^^L||$($dob)|F||5^Indigenous - Aboriginal NOT T.S.I.|$($pt_suffix) Nice Road^^EPPING^VIC^3076^1100^P||$($phone)^PRN^PH~$($mobile)^PRN^CP~$($email)^NET^Internet||$($language)|1^SINGLE|2079^Catholic, nec||||||1100|||||||N`rPD1|||CAMPASPE FAMILY PRACTICE^GPPRC^HP5511|G9299^Badar^Shagufta^^^DR^^prof_carers^HP5511^L^^^MAIN~4132744T^Badar^Shagufta^^^DR^^prof_carers^HP5511^L^^^PROVN~4132744T^Badar^Shagufta^^^DR^^prof_carers^NSP^L^^^PROV^HP5511~G9299^Badar^Shagufta^^^DR^^prof_carers^HP5511^L^^^LOCAL`rROL|2497324^PATPC|AD|PP^GP|G9299^Badar^Shagufta^^^DR|20121102000000||||GMPRC^General Practitioner^PRTYP||7 - 25 Caroline Chisolm Drive^Po Box 962^Kyneton^VIC^3444^1100^B^24130~Campaspe Family Practice^P.O. Box 962^Kyneton^VIC^3444^1100^B^24130|5422 2788^WPN^FX~5422 2788^WPN^PH~5422 2788^WPN^FX~5422 2877^WPN^PH`rPV1||E|NEWA|C-HOS|||||||||||||^^^^^^^^EDIS||068330_$($pt_suffix)|||||||||||||||||||||||||20221220080000||||||068330_$($pt_suffix)" `
		| Out-File -Encoding Utf8 $(Join-Path $out_dir_path "$($ur)_1.hl7")
	
	ECHO "MSH|^~\&|EDIS|1280|HSIE|1280|20221220080010||ADT^A03|12720656_$($i)|V|2.4|||AL|NE||ASCII`rEVN|A03|20221220080010`rPID|||$($ur)^^^^MR^1280~4545454545^^^AUSHIC^MC^^20221221||TestZedoc$($pt_suffix)^ZdTest^TZ$($pt_suffix)^^MRS^^L||$($dob)|F||5^Indigenous - Aboriginal NOT T.S.I.|$($pt_suffix) Nice Road^^EPPING^VIC^3076^1100^P||$($phone)^PRN^PH~$($mobile)^PRN^CP~$($email)^NET^Internet||$($language)|1^SINGLE|2079^Catholic, nec||||||1100|||||||N`rPV1||E|NEWA|C-HOS|||||||||||||^^^^^^^^EDIS||068330_$($pt_suffix)|1||||||||||||||||T4|NSP|||||||20221220080000|20221220080010|||||068330_$($pt_suffix)" `
		| Out-File -Encoding Utf8 $(Join-Path $out_dir_path "$($ur)_2.hl7")
	
	ECHO "$($ur),$([datetime]::parseexact($dob, "yyyyMMdd", $null) | Get-Date -format "yyyy-MM-dd"),$($language.split('^')[1]),$($mobile),$($email),GEN" >> $out_report_file
}