from time import sleep
import subprocess
import re
import h2o



def check_h2o_active(): 
    cnamejson = subprocess.Popen(["curl","-s","http://localhost:54321/3/Cloud"],stdout=subprocess.PIPE).communicate()[0]
    cname     = re.sub('.*"cloud_name":"([^"]*).*', '\\1', cnamejson)
    return(cname=='h2o_cloud')

if check_h2o_active():
    print('Existing H2O Cloud...')
else:
    print('Initiating H2O Cloud...')
    subprocess.call(['/home/cloudera/demo/init/h2o_hadoop_init.sh'])

sleep(30)

x=1
while (x<420 & (not check_h2o_active())):
    ++x
    sleep(1.5)
    print('.')

hc = h2o.init(ip = "localhost", port = 54321)

