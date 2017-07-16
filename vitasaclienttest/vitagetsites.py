import requests
import json

url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites'

myheaders = { 'Content-type' : 'application/json' }

r = requests.get(url, headers=myheaders)

if (r.status_code == requests.codes.ok):
	jsons = r.json()

	if isinstance(jsons, str):
		jsonr = json.loads(jsons)
		#print('Success: ' + json.dumps(jsonj))
		for s in jsonr:
			print('Site: {0} at {1}, {2}, {3}, {4}'.format(s['Name'], s['xstreet'], s['xcity'], s['xstate'], s['xzip']))
	else:
		print('Failed ({0})'.format(jsons['errorMessage']))
		# for rr in jsons:
		# 	print('zz: {0} : {1}'.format(rr, jsons[rr]))
else:
	print('Failed ({0})'.format(r.status_code))