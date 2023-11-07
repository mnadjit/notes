/***************************************************************************************************
Script Name:		initial_iPM_data_load_for_MediRecords
Create Date:        2022-02-08
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        Initial load of patient data for Medirecords
Called by:          No procedures are currently supposed to call this query. Only meant to be run on an ad-hoc basis.
table(s) Updated:   N/A
table(s) Read:      PIMS.patients, PIMS.patient_ids, PIMS.reference_values, PIMS.merged_patients
Used By:            
Parameter(s):       N/A
Usage:              Run the SQL query against iPM's Oracle databases. Beware of performance hit it may cause.
Other info:				
					Stats (2022-08-03 iPM UAT):
						total patient count in UAT: 1,324,892
						patnt_refno range:   639968   to   2729690
					Data Fields Required by MediRecords: 
						URnumber, previousUR_number (if merged record), medicare number, medicare irn, medicare expiry, lastname, firstname 1-5, middlename, title, gender, dob, ihi number
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------

***************************************************************************************************/

SELECT
    pid_ur.identifier AS NH_URnumber, pid_mc.identifier AS medicare, pid_mc.end_dttm AS medicare_expiry, 
    pt.upper_surname AS lastname, pt.forename AS firstname, pt.second_forename AS middlename,
    rv_title.description AS title, rv_sexxx.description AS sex, 
    to_char(pt.date_of_birth, 'YYYY-MM-dd') AS dob, pid_ni.identifier AS IHI,
    LISTAGG(min_pid.identifier, ';') WITHIN GROUP (ORDER BY pid_ur.identifier) "previous_URs"
FROM 
    pims.patients pt
LEFT JOIN PIMS.patient_ids pid_ur ON pt.patnt_refno = pid_ur.patnt_refno AND pid_ur.archv_flag = 'N' AND pid_ur.end_dttm IS NULL AND pid_ur.pityp_refno = '11553'  -- 11553 is NH UR numver id type code
LEFT JOIN PIMS.patient_ids pid_mc ON pt.patnt_refno = pid_mc.patnt_refno AND pid_mc.archv_flag = 'N' AND (pid_mc.end_dttm IS NULL OR pid_mc.end_dttm > SYSDATE) AND pid_mc.pityp_refno = '11548'  -- 11548 is Medicare id type code
LEFT JOIN PIMS.patient_ids pid_ni ON pt.patnt_refno = pid_ni.patnt_refno AND pid_ni.archv_flag = 'N' AND (pid_ni.end_dttm IS NULL OR pid_ni.end_dttm > SYSDATE) AND pid_ni.pityp_refno = '35249'  -- 35249 is IHI id type code
LEFT JOIN PIMS.reference_values rv_title ON pt.title_refno = rv_title.rfval_refno AND rv_title.archv_flag = 'N' AND rv_title.end_dttm IS NULL 
LEFT JOIN PIMS.reference_values rv_sexxx ON pt.sexxx_refno = rv_sexxx.rfval_refno AND rv_sexxx.archv_flag = 'N' AND rv_sexxx.end_dttm IS NULL 
LEFT JOIN 
    (
        SELECT 
			merged.patnt_refno AS patnt_refno, merged.prev_patnt_refno, 
			row_number() OVER (PARTITION BY merged.patnt_refno, merged.prev_patnt_refno ORDER BY merged.patnt_refno) AS rn
        FROM PIMS.merged_patients merged
        ORDER BY merged.patnt_refno, merged.prev_patnt_refno
    ) mrg ON pt.patnt_refno = mrg.patnt_refno
LEFT JOIN PIMS.patient_ids min_pid ON min_pid.patnt_refno = mrg.prev_patnt_refno AND min_pid.pityp_refno = '11553'  
WHERE 
    pt.archv_flag = 'N' AND (mrg.rn IS NULL OR mrg.rn = '1')
    AND pt.patnt_refno BETWEEN '1000001' AND '1100000'
    --AND ROWNUM < 10000
GROUP BY
    pid_ur.identifier, pt.patnt_refno, pid_mc.identifier, pid_mc.end_dttm, pt.upper_surname, pt.forename,
    pt.second_forename, rv_title.description, rv_sexxx.description, pt.date_of_birth, pid_ni.identifier
ORDER BY 
    pt.patnt_refno;