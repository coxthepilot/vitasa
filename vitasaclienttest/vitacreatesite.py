import requests
import json

bodydata = { 
	'name' : 'site789', 
	'xstreet' : 'new street',
	'xcity' : 'new city',
	'xstate' : 'new state',
	'xzip' : 'new zip',
	'latitude' : '2.7',
	'longitude' : '-2.7',
	'opentime' : 'my open time',
	'closetime' : 'my close time',
	'days' : 'my days of the week',
	'sitecoordinator' : 'fred', 
	'sitetype' : 'permanent' 
}

url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites'

myheaders = { 'Content-type' : 'application/json' }
r = requests.post(url, data=json.dumps(bodydata), headers=myheaders)

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