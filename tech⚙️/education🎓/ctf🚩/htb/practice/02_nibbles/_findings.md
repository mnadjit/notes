[Walkthrough Video - YouTube](https://www.youtube.com/watch?v=s_0GcRGv6Ds&list=PLidcsTyj9JXK-fnabFLVEvHinQ14Jy5tf&index=3)

```
IP: 10.10.10.75
```


# Wappalyzer
`/nibbleblog/index.php`
![[Pasted image 20231214105046.png]]


Downloaded NibbleBlog v4.0.5 from https://sourceforge.net/projects/nibbleblog/
searched for 4.0.5 to see where we can find version info:
```
$ grep -R 4.0.5 . | cut -d ':' -f 1 | uniq
./admin/boot/rules/98-constants.bit
./admin/js/tinymce/skins/lightgray/fonts/tinymce-small.svg
./admin/js/tinymce/skins/lightgray/fonts/tinymce.svg
```

view-source:http://10.10.10.75/nibbleblog/admin/boot/rules/98-constants.bit
```
<?php
/*
 * Nibbleblog
 * http://www.nibbleblog.com

 * Require
 *

 * Return
 *
*/

// =====================================================================
//	SYSTEM INFORMATION
// =====================================================================
define('NIBBLEBLOG_VERSION',		'4.0.3');
define('NIBBLEBLOG_NAME',			'Coffee');
define('NIBBLEBLOG_RELEASE_DATE',	'01/04/2014');
define('NIBBLEBLOG_BUILD',			1396309604);

// =====================================================================
//	DEBUG
// =====================================================================
define('DEBUG_MODE',	TRUE);

error_reporting(0);

if(DEBUG_MODE)
{
	ini_set("display_errors", 1);
	ini_set('display_startup_errors',1);
	ini_set("track_errors", 1);
	ini_set("html_errors", 1);
	error_reporting(E_ALL | E_STRICT | E_NOTICE);
}

?>
```

Version: 4.0.3

metasploit `multi/http/nibbleblog_file_upload`

