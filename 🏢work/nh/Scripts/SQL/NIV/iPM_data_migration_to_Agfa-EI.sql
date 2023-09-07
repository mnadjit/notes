/***************************************************************************************************
Script Name:		initial_iPM_data_load_for_Agfa-EI
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
    pt.patnt_refno,
    pid_ur.identifier AS PATIENTID, 'MR' AS ISSUEROFPATIENTID, 
    pt.upper_surname AS LASTNAME, 
    pt.forename AS FIRSTNAME,
    pt.second_forename AS MIDDLENAME,
    to_char(pt.date_of_birth, 'YYYYMMdd') AS DATEOFBIRTH,
    CASE WHEN rv_sexxx.description='Female' THEN 'F' WHEN rv_sexxx.description='Male' THEN 'M' ELSE 'O' END AS SEX,
    rv_title.description AS PREFIX,
    rv_cntry.description AS BIRTHPLACE,
    to_char(pt.date_of_death, 'YYYYMMdd') AS DECEASEDDATETIME,
    adds.ADDRESS AS HOMEADDRESSSTREET, adds.city AS HOMEADDRESSCITY, adds.state AS HOMEADDRESSSTATE, adds.postcode AS HOMEADDRESSZIPCODE, adds.cntry AS HOMEADDRESSCOUNTRY,
    phones.phone AS HOMEPHONENUMBER, mobiles.mobile AS HOMEMOBILENUMBER, emails.email AS HOMEEMAIL
    --pid_mc.identifier AS medicare, pid_mc.end_dttm AS medicare_expiry,   
    --pid_ni.identifier AS IHI
FROM 
    pims.patients pt
    LEFT JOIN PIMS.patient_ids pid_ur ON pt.patnt_refno = pid_ur.patnt_refno AND pid_ur.archv_flag = 'N' AND pid_ur.end_dttm IS NULL AND pid_ur.pityp_refno = '11553'  -- 11553 is NH UR numver id type code
    LEFT JOIN PIMS.patient_ids pid_mc ON pt.patnt_refno = pid_mc.patnt_refno AND pid_mc.archv_flag = 'N' AND (pid_mc.end_dttm IS NULL OR pid_mc.end_dttm > SYSDATE) AND pid_mc.pityp_refno = '11548'  -- 11548 is Medicare id type code
    LEFT JOIN PIMS.patient_ids pid_ni ON pt.patnt_refno = pid_ni.patnt_refno AND pid_ni.archv_flag = 'N' AND (pid_ni.end_dttm IS NULL OR pid_ni.end_dttm > SYSDATE) AND pid_ni.pityp_refno = '35249'  -- 35249 is IHI id type code
    LEFT JOIN PIMS.reference_values rv_title ON rv_title.rfvdm_code = 'TITLE' AND pt.title_refno = rv_title.rfval_refno AND rv_title.archv_flag = 'N' AND rv_title.end_dttm IS NULL 
    LEFT JOIN PIMS.reference_values rv_sexxx ON rv_sexxx.rfvdm_code = 'SEXXX' AND pt.sexxx_refno = rv_sexxx.rfval_refno AND rv_sexxx.archv_flag = 'N' AND rv_sexxx.end_dttm IS NULL 
    LEFT JOIN PIMS.reference_values rv_cntry ON rv_cntry.rfvdm_code = 'CNTRY' AND pt.cntry_refno = rv_cntry.rfval_refno AND rv_cntry.archv_flag = 'N' AND rv_cntry.end_dttm IS NULL 
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, 
        CASE WHEN (ad.Line2 IS NULL OR ad.line2 = '') THEN ad.Line1 ELSE ad.Line1 || '; ' || ad.Line2 END AS ADDRESS,
        ad.suburb AS city, ad.state_code AS state, ad.pcode AS postcode, rv_cntry_add.main_code AS cntry
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
        LEFT JOIN PIMS.reference_values rv_cntry_add ON rv_cntry_add.rfvdm_code = 'CNTRY' AND ad.cntry_refno = rv_cntry_add.rfval_refno AND rv_cntry_add.archv_flag = 'N' AND rv_cntry_add.end_dttm IS NULL 
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'POSTL'
    ) adds ON adds.refno = pt.patnt_refno
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, ad.line1 AS phone
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'PHONE'
    ) phones ON phones.refno = pt.patnt_refno 
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, ad.line1 AS mobile
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'MOB'
    ) mobiles ON mobiles.refno = pt.patnt_refno 
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, ad.line1 AS email
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'EMAIL'
    ) emails ON emails.refno = pt.patnt_refno 
WHERE 
    --pt.archv_flag = 'N' AND (mrg.rn IS NULL OR mrg.rn = '1')
    --AND pt.patnt_refno BETWEEN '1000001' AND '1100000'
    --pt.patnt_refno BETWEEN '0000815' AND '0000836'
    --(pid_ur.identifier = '6000021' OR
    --pid_ur.identifier BETWEEN '0000815' AND '0000820')
    pid_ur.identifier = '6000021'
    --AND rownum < 12
GROUP BY
    pid_ur.identifier, pt.patnt_refno, 
    --pid_mc.identifier, pid_mc.end_dttm, 
    pt.upper_surname, pt.forename,
    pt.second_forename, rv_title.description, rv_sexxx.description, pt.date_of_birth, pid_ni.identifier, pt.cntry_refno, pt.date_of_death, rv_cntry.description, 
    adds.ADDRESS, adds.city, adds.state, adds.postcode, adds.cntry, phones.phone, mobiles.mobile, emails.email
ORDER BY pt.patnt_refno DESC;

select ad.*, adr.* from patients pt 
left join PIMS.address_roles adr ON adr.patnt_refno = pt.patnt_refno AND adr.archv_flag = 'N' AND adr.end_dttm IS NULL
left join pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
WHERE pt.patnt_refno = '2968120';
