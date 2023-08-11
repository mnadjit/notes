import os
import hl7
import re

a = 0
dir_path = 'C:\\temp\\messages-20211019-145838\\'
urs = []
info = []
for f in os.listdir(dir_path):
    a += 1
    with open(dir_path + f, 'r') as h:
        file_content = h.read()
        if (False):
            segs = re.findall('^\w{3}\|.*', file_content, re.MULTILINE)
            m = hl7.parse('\r'.join(segs))
            m_datetime = m.segments("MSH")[0][7]
            m_event_type = m.segments("MSH")[0][9][0][1]
            pid3_reps = str(m.segments("PID")[0][3]).split('~')
            medicares = []
            if len(pid3_reps) > 1:
                for pid3 in pid3_reps:
                    pid3s = pid3.split('^')
                    if pid3s[4] == "MC": medicares.append(pid3)
                    if pid3s[4] == "MR": ur = pid3s[0]
                if (len(medicares) > 1):
                    #print(f'UR: {ur}  [{m_event_type}]    ({m_datetime})')
                    #print(medicares)
                    #print('-----------------')
                    if ur not in urs: urs.append(ur)
    
        fail_msg_parts = re.findall('^\(2\)\:\W\d{8,10}.*[-]', file_content, re.MULTILINE)[0].split(' ')
        if (len(fail_msg_parts) > 1): msg_id = fail_msg_parts[1].replace(':', '')
        if (len(fail_msg_parts) > 5): ur = fail_msg_parts[5]
        if ur not in urs: 
            urs.append(ur)
            info.append((ur, msg_id))
            
        #if a == 10: break
print(info)
print(len(urs))
