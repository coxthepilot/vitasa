import requests
import json

url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites/siteabc'

myheaders = { 'Content-type' : 'application/json' }

r = requests.delete(url, headers=myheaders)

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