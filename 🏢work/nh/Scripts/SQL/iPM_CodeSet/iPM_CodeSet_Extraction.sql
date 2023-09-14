/***************************************************************************************************
Script Name:		iPM_CodeSet_Extraction.sql
Create Date:        2023-09-14
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        
Called by:          No procedures are supposed to call this query. Only meant to be run on an ad-hoc basis.
table(s) Updated:   N/A
table(s) Read:      PIMS.reference_values, reference_value_ids
Used By:            
Parameter(s):       N/A
Usage:              Run the SQL query against iPM's Oracle databases. Be wary of the performance hit it may cause.
Other info:			
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------

***************************************************************************************************/

-- Hospital Campuses - PV1-3.4 (Facility), MSH-4, MSH-6
SELECT DISTINCT (ho.main_ident), ho.description FROM PIMS.health_organisations ho
LEFT JOIN PIMS.health_organisation_ids hoi ON ho.heorg_refno=hoi.heorg_refno AND hoi.archv_flag='N' AND hoi.end_dttm IS NULL
WHERE ho.archv_flag='N' AND ho.end_dttm IS NULL AND
hoi.identifier IN ('1280', '2970', '3670', '1090');

-- Service Points / Locations (PV1-3.1, .2)
SELECT sp.code AS HL7_Code, sp.description AS ServicePoint_Name, ho.description AS Campus, rv.description AS Type
FROM PIMS.service_points sp
LEFT JOIN PIMS.health_organisations ho ON sp.heorg_refno=ho.heorg_refno AND ho.archv_flag='N' AND ho.end_dttm IS NULL
LEFT JOIN PIMS.reference_values rv ON rv.rfvdm_code='SPTYP' AND rv.archv_flag='N' AND rv.end_dttm IS NULL
WHERE sp.archv_flag='N' AND sp.curnt_flag='Y' AND sp.end_dttm IS NULL
AND rv.main_code IN ('WARD', 'THEAT', 'CLINIC') 
--GROUP BY rv.main_code, ho.description, rv.description, sp.code, sp.description
ORDER BY sp.code
;

select * from PIMS.reference_values rv WHERE rv.rfvdm_code like 'SPTYP';

-- PID-3 (Patient ID Types/Insurance Policies)
SELECT
    CASE WHEN rvi.identifier IS NULL THEN rv.main_code ELSE rvi.identifier END AS HL7_Code, rvi.identifier, rv.description, rv.main_code, 
    CASE WHEN rv.rfvdm_code='PITYP' THEN 'Patient Identifier Type' ELSE 'Policy Type' END AS Category
FROM reference_values rv
LEFT JOIN reference_value_ids rvi ON rvi.rfval_refno = rv.rfval_refno AND rvi.rityp_code='HL7' AND rvi.archv_flag='N' and rvi.end_dttm IS NULL
WHERE rv.rfvdm_code IN ('PITYP', 'PLATP') AND rv.archv_flag='N' AND rv.end_dttm IS NULL AND rv.display_value='Y'
ORDER BY HL7_Code;