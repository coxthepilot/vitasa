import requests
import json


bodydata = { 
	'name' : 'site123',
	'xstreet' : 'new street-2',
	'xcity' : 'new city-2',
	'xstate' : 'new state-2',
	'xzip' : 'new zip-2',
	'latitude' : '2.72',
	'longitude' : '-2.72',
	'opentime' : 'my open time-2',
	'closetime' : 'my close time-2',
	'days' : 'my days of the week-2',
	'sitecoordinator' : 'fred-2', 
	'sitetype' : 'permanent-2' 
}

url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites'
myheaders = { 'Content-type' : 'application/json' }

r = requests.put(url, data=json.dumps(bodydata), headers=myheaders)

if (r.status_code == requests.codes.ok):
	jsons = r.json()

	if isinstance(jsons, str):
		jsonj = json.loads(jsons)
		#print('Success: ' + json.dumps(jsonj))
		print('Success')
	else:
		print('Failed ({0})'.format(jsons['errorMessage']))
		# for rr in jsons:
		# 	print('zz: {0} : {1}'.format(rr, jsons[rr]))
else:
	print('Failed ({0})'.format(r.status_code))