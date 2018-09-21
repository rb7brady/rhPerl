import json

with open('/opt/rh/endpoints.conf') as json_file:  
    data = json.load(json_file)
    for key,value in data.iteritems():
	 print value
