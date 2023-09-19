/***************************************************************************************************
Script Name:		initial_iPM_data_load_for_Karisma
Create Date:        2022-02-08
Author:             Mehdi N Tehrani <mehdi.tehrani@nh.org.au; m.nadji.t@gmail.com>
Description:        Initial load of patient data for Kaarisma
Called by:          No procedures are supposed to call this query. Only meant to be run on an ad-hoc basis.
table(s) Updated:   N/A
table(s) Read:      PIMS.patients, PIMS.patient_ids, PIMS.reference_values, PIMS.address_roles, PIMS.addresses
Used By:            
Parameter(s):       N/A
Usage:              Run the SQL query against iPM's Oracle databases. Be wary of the performance hit it may cause.
Other info:				
					Stats (2023-09-08 iPM UAT):
						total patient count in UAT: 2,328,152
						patnt_refno range:   639968   to   2968120
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              				Comments
-----------------   -------				 				------------------------------------------------------------

***************************************************************************************************/

SELECT
    --pt.patnt_refno,
    pid_ur.identifier AS NH_UR,
    pid_mc.identifier AS MEDICARE_NO,
    TO_CHAR(pid_mc.end_dttm, 'YYYYMMdd') AS MEDICARE_EXPIRY,
    pid_ni.identifier AS IHI_NO,
    pid_dv.identifier AS DVA,
    pt.upper_surname AS LASTNAME,
    pt.forename AS FIRSTNAME,
    pt.second_forename AS MIDDLENAME,
    TO_CHAR(pt.date_of_birth, 'YYYYMMdd') AS DATEOFBIRTH,
    CASE WHEN rv_sexxx.description='Female' THEN 'F' WHEN rv_sexxx.description='Male' THEN 'M' ELSE 'O' END AS SEX,
    rv_title.description AS PREFIX,
    rv_cntry.description AS BIRTHPLACE,
    to_char(pt.date_of_death, 'YYYYMMdd') AS DECEASEDDATETIME,
    adds.ADDRESS AS HOMEADDRESSSTREET, adds.city AS HOMEADDRESSCITY, adds.state AS HOMEADDRESSSTATE, adds.postcode AS HOMEADDRESSZIPCODE, 
    CASE WHEN adds.cntry = '1108' THEN '1100' ELSE adds.cntry END AS HOMEADDRESSCOUNTRY,
    REGEXP_REPLACE(phones.phone, ' ', '') AS HOMEPHONENUMBER,
    CASE WHEN REGEXP_LIKE(mobiles.mobile, '^04(\d\s?){8}') THEN REGEXP_REPLACE( REGEXP_REPLACE(mobiles.mobile, ' ', ''), '^04', '+614') ELSE '' END AS HOMEMOBILENUMBER, 
    emails.email AS HOMEEMAIL
FROM
    pims.patients pt
    LEFT JOIN PIMS.patient_ids pid_ur ON pt.patnt_refno = pid_ur.patnt_refno AND pid_ur.archv_flag = 'N' AND pid_ur.end_dttm IS NULL AND pid_ur.pityp_refno = '11553'  -- 11553 is NH UR numver id type code
    LEFT JOIN ( 
        SELECT mc.patnt_refno, mc.identifier, mc.end_dttm, row_number() OVER (PARTITION BY mc.patnt_refno ORDER BY mc.modif_dttm DESC) AS rn
        FROM PIMS.patient_ids mc Where mc.archv_flag = 'N' AND (mc.end_dttm IS NULL OR mc.end_dttm > SYSDATE) AND mc.pityp_refno = '11548'  -- 11548 is Medicare id type code
    ) pid_mc ON pt.patnt_refno = pid_mc.patnt_refno AND pid_mc.rn = 1
    LEFT JOIN PIMS.patient_ids pid_ni ON pt.patnt_refno = pid_ni.patnt_refno AND pid_ni.archv_flag = 'N' AND (pid_ni.end_dttm IS NULL OR pid_ni.end_dttm > SYSDATE) AND pid_ni.pityp_refno = '35249'  -- 35249 is IHI id type code
    LEFT JOIN ( 
        SELECT dv.patnt_refno, dv.identifier, dv.end_dttm, row_number() OVER (PARTITION BY dv.patnt_refno ORDER BY dv.modif_dttm DESC) AS rn
        FROM PIMS.patient_ids dv Where dv.archv_flag = 'N' AND (dv.end_dttm IS NULL OR dv.end_dttm > SYSDATE) AND dv.pityp_refno IN ('19352', '50346', '50347', '50348') -- 19352 is DVA id type code, 50346: DVG, 50347: DVO, 50348: DVW
    ) pid_dv ON pt.patnt_refno = pid_dv.patnt_refno AND pid_dv.rn = 1
    --LEFT JOIN PIMS.patient_ids pid_dv ON pt.patnt_refno = pid_dv.patnt_refno AND pid_dv.archv_flag = 'N' AND (pid_dv.end_dttm IS NULL OR pid_dv.end_dttm > SYSDATE) AND pid_dv.pityp_refno in ('19352', '50346', '50347', '50348') -- 19352 is DVA id type code, 50346: DVG, 50347: DVO, 50348: DVW
    LEFT JOIN PIMS.reference_values rv_title ON rv_title.rfvdm_code = 'TITLE' AND pt.title_refno = rv_title.rfval_refno AND rv_title.archv_flag = 'N' AND rv_title.end_dttm IS NULL 
    LEFT JOIN PIMS.reference_values rv_sexxx ON rv_sexxx.rfvdm_code = 'SEXXX' AND pt.sexxx_refno = rv_sexxx.rfval_refno AND rv_sexxx.archv_flag = 'N' AND rv_sexxx.end_dttm IS NULL 
    LEFT JOIN PIMS.reference_values rv_cntry ON rv_cntry.rfvdm_code = 'CNTRY' AND pt.cntry_refno = rv_cntry.rfval_refno AND rv_cntry.archv_flag = 'N' AND rv_cntry.end_dttm IS NULL 
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, row_number() OVER (PARTITION BY adr.patnt_refno ORDER BY ad.modif_dttm DESC) AS rn,
        CASE WHEN (ad.Line2 IS NULL OR ad.line2 = '') THEN ad.Line1 ELSE ad.Line1 || '; ' || ad.Line2 END AS ADDRESS,
        ad.suburb AS city, ad.state_code AS state, ad.pcode AS postcode, SUBSTR(rv_cntry_add.main_code, 1, 4) AS cntry
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL AND adr.rotyp_code = 'HOME' AND adr.curnt_flag = 'Y'
        LEFT JOIN PIMS.reference_values rv_cntry_add ON rv_cntry_add.rfvdm_code = 'CNTRY' AND ad.cntry_refno = rv_cntry_add.rfval_refno AND rv_cntry_add.archv_flag = 'N' AND rv_cntry_add.end_dttm IS NULL 
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'POSTL'
    ) adds ON adds.refno = pt.patnt_refno AND adds.rn=1
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, row_number() OVER (PARTITION BY adr.patnt_refno ORDER BY ad.modif_dttm DESC) AS rn, ad.line1 AS phone
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL AND adr.rotyp_code = 'HOME' AND adr.curnt_flag = 'Y'
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'PHONE'
    ) phones ON phones.refno = pt.patnt_refno AND phones.rn=1
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, row_number() OVER (PARTITION BY adr.patnt_refno ORDER BY ad.modif_dttm DESC) AS rn, ad.line1 AS mobile
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL AND adr.rotyp_code = 'HOME' AND adr.curnt_flag = 'Y'
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'MOB'
    ) mobiles ON mobiles.refno = pt.patnt_refno AND mobiles.rn=1
    LEFT JOIN (
        SELECT adr.patnt_refno AS refno, row_number() OVER (PARTITION BY adr.patnt_refno ORDER BY ad.modif_dttm DESC) AS rn, REGEXP_REPLACE(ad.line1, '[\x0A|\x0B|\x0D|[:space:]]', '', 1, 0) AS email
        FROM PIMS.address_roles adr 
        LEFT JOIN pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL AND adr.rotyp_code = 'HOME' AND adr.curnt_flag = 'Y'
        WHERE adr.archv_flag = 'N' AND adr.end_dttm IS NULL AND ad.adtyp_code = 'EMAIL'
    ) emails ON emails.refno = pt.patnt_refno AND emails.rn=1
WHERE
    pt.archv_flag = 'N' AND
    pt.date_of_birth IS NOT NULL AND pt.upper_surname IS NOT NULL AND pt.forename IS NOT NULL AND pid_ur.identifier IS NOT NULL AND
    --pt.patnt_refno < '1000001'
    --pt.patnt_refno BETWEEN '1000001' AND '1500000'
    --pt.patnt_refno BETWEEN '1500001' AND '2100000'
    pt.patnt_refno > '2100000'
    --pid_ur.identifier in ('0122361','0149695','0344373','0595879','0606003','0611720','0749359','2022834','2504520','3080818','3085621','0150937','2168330','2621270','0137225','0476919','0539183','0558045','0562928','0629103','0724219','0733980','0827631','2004354','2380814','2425876','2453563','2854562','2874953','3148274','3165678','0317118','0486327','0598988','2493620','2680283','3024635','3336562','0114443','0376747','0461427','0501977','0573236','0682988','0734757','0738448','2045064','2860097','3334795','3341402','0205550','0228624','0263476','0308614','0316571','0396536','0470418','0476956','0563152','0713106','0713108','2183999','2351716','3058034','3065554','3143037','3233788','3264758','3314097','0143322','0616671','0687222','0820023','2224337','2434389','2616063','3180198','3358629','0477140','0660872','2034284','2099504','2634206','2698427')
GROUP BY
    pid_ur.identifier, pt.patnt_refno, 
    pid_mc.identifier, pid_mc.end_dttm, pid_ni.identifier, pid_dv.identifier,
    pt.upper_surname, pt.forename,
    pt.second_forename, rv_title.description, rv_sexxx.description, pt.date_of_birth, 
    pt.cntry_refno, pt.date_of_death, rv_cntry.description,
    adds.ADDRESS, adds.city, adds.state, adds.postcode, adds.cntry, phones.phone, mobiles.mobile, emails.email
ORDER BY pt.patnt_refno DESC;
--ORDER BY pid_ur.identifier DESC;

/*
SELECT ad.*, adr.* from patients pt 
left join PIMS.address_roles adr ON adr.patnt_refno = pt.patnt_refno AND adr.archv_flag = 'N' AND adr.end_dttm IS NULL
left join pims.addresses ad ON adr.addss_refno = ad.addss_refno AND ad.archv_flag = 'N' AND adr.end_dttm IS NULL
WHERE pt.patnt_refno = '2968120';

SELECT line1, CASE WHEN REGEXP_LIKE(ad.line1, '^04(\d\s?){8}') THEN REGEXP_REPLACE( REGEXP_REPLACE(ad.line1, ' ', ''), '^04', '+614') ELSE '' END mob
FROM addresses ad where rownum < 10;

select * from patient_ids pid where REGEXP_LIKE(pid.identifier, '^VA') and rownum < 100;
select * from reference_values rv where rv.rfvdm_code = 'PITYP' AND rv.main_code like 'DV%';

select MAX(identifier) from patient_ids where REGEXP_LIKE(identifier, '^1\d{6}') and pityp_refno = '11553';
*/