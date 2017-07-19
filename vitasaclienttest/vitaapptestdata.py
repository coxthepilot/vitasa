import requests
import json
import urllib

class VitaSite:
	"""Defines the concept of a VITA Site and supporting capabilities"""

	def __init__(self):
		"""create an empty VitaSite; use Create to create a new site, Load to load existing"""

		# install default values for each instance field
		self._name = ''
		self._slug = ''
		self._street = ''
		self._city = ''
		#self._state = ''
		self._zipcode = ''
		self._latitude = 0.0
		self._longitude = 0.0
		self._opentime = ''
		self._closetime = ''
		self._days = ''
		self._sitecoordinator = ''
		self._sitetype = ''
		self._is_open = False

	def load(self, nameOfSiteToLoad):
		"""load this instance from the DB; returns True if successful"""

		urlEncodedNameOfSiteToLoad = urllib.parse.quote(nameOfSiteToLoad)
		url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites/' + urlEncodedNameOfSiteToLoad
		myheaders = { 'Content-type' : 'application/json' }
		r = requests.get(url, headers=myheaders)

		if (r.status_code != requests.codes.ok):
			#print('Load failed: bad status code {0}'.format(r.status_code))
			return False

		#since the response exists, get the json coded result
		jsons = r.json()
		#if the response isn't a string, then an error has occurred
		if not isinstance(jsons, str):
			#print('Load failed ({0})'.format(jsons['errorMessage']))
			return False

		#since it is a string, convert to json format so we can look at the results
		jsonr = json.loads(jsons)

		#make sure the record we retrieve is the one we asked for
		if 'name' not in jsonr:
			#print("Load failed: site name not in response")
			return False

		if nameOfSiteToLoad != jsonr['name']:
			res = False
		self._name = jsonr['name']

		#for each of the variables, make sure it is in the response

		if 'xstreet' in jsonr:
			self._street = jsonr['xstreet']

		if 'xcity' in jsonr:
			self._city = jsonr['xcity']

		if 'xstate' in jsonr:
			self._state = jsonr['xstate']

		if 'xzip' in jsonr:
			self._zipcode = jsonr['xzip']

		if 'latitude' in jsonr:
			self._latitude = jsonr['latitude']

		if 'longitude' in jsonr:
			self._longitude = jsonr['longitude']

		if 'opentime' in jsonr:
			self._opentime = jsonr['opentime']

		if 'closetime' in jsonr:
			self._closetime = jsonr['closetime']

		if 'days' in jsonr:
			self._days = jsonr['days']

		if 'sitecoordinator' in jsonr:
			self._sitecoordinator = jsonr['sitecoordinator']

		if 'sitetype' in jsonr:
			self._sitetype = jsonr['sitetype']

		return True

	def update(self):
		"""update the site record with the current values"""

		#start the place where the values get stored
		bodydata = { }

		#make sure each of the attributes has a value
		if not self._name:
			return False
		bodydata['name'] = self._name

		if not self._street:
			return False
		bodydata['xstreet'] = self._street

		if not self._city:
			return False
		bodydata['xcity'] = self._city

		if not self._state:
			return False
		bodydata['xstate'] = self._state

		if not self._zipcode:
			return False
		bodydata['xzip'] = self._zipcode

		if not self._latitude:
			return False
		bodydata['latitude'] = self._latitude

		if not self._longitude:
			return False
		bodydata['longitude'] = self._longitude

		if not self._opentime:
			return False
		bodydata['opentime'] = self._opentime

		if not self._closetime:
			return False
		bodydata['closetime'] = self._closetime

		if not self._days:
			return False
		bodydata['days'] = self._days

		if not self._sitecoordinator:
			return False
		bodydata['sitecoordinator'] = self._sitecoordinator

		if not self._sitetype:
			return False
		bodydata['sitetype'] = self._sitetype

		url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites'
		myheaders = { 'Content-type' : 'application/json' }

		r = requests.put(url, data=json.dumps(bodydata), headers=myheaders)

		if (r.status_code != requests.codes.ok):
			#print('Update failed ({0})'.format(r.status_code))
			return False

		jsons = r.json()

		if not isinstance(jsons, str):
			#print('Failed ({0})'.format(jsons['errorMessage']))
			return False

		#jsonj = json.loads(jsons)

		return True

	def delete(self):

		urlEncodedNameOfSiteToLoad = urllib.parse.quote(self._name)
		url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites/' + urlEncodedNameOfSiteToLoad

		myheaders = { 'Content-type' : 'application/json' }

		r = requests.delete(url, headers=myheaders)

		if (r.status_code != requests.codes.ok):
			#print('Delete failed ({0})'.format(r.status_code))
			return False

		jsons = r.json()

		if not isinstance(jsons, str):
			#print('Delete failed ({0})'.format(jsons['errorMessage']))
			return False

		#jsonj = json.loads(jsons)
		#print('Success: ' + json.dumps(jsonj))

		return True

	def create(self):
		"""create a new site with the values stored in the instance"""

		#make sure each of the attributes has a value
		bodydata = { }
		if not self._name:
			return False
		bodydata['name'] = self._name

		if not self._slug:
			return False
		bodydata['slug'] = self._slug

		if not self._street:
			return False
		bodydata['xstreet'] = self._street

		if not self._city:
			return False
		bodydata['xcity'] = self._city

		# if not self._state:
		# 	return False
		# bodydata['xstate'] = self._state

		if not self._zipcode:
			return False
		bodydata['xzip'] = self._zipcode

		if not self._latitude:
			return False
		bodydata['latitude'] = self._latitude

		if not self._longitude:
			return False
		bodydata['longitude'] = self._longitude

		if not self._opentime:
			return False
		bodydata['opentime'] = self._opentime

		if not self._closetime:
			return False
		bodydata['closetime'] = self._closetime

		if not self._days:
			return False
		bodydata['days'] = self._days

		if not self._sitecoordinator:
			return False
		bodydata['sitecoordinator'] = self._sitecoordinator

		if not self._sitetype:
			return False
		bodydata['sitetype'] = self._sitetype

		# if not self._is_open:
		# 	return False
		bodydata['is_open'] = self._is_open

		body = { }
		body['body'] = bodydata

		print(' - body: {0}'.format(json.dumps(body)))

		print(' - making the create call')
		url = 'https://h4ebpp3rvk.execute-api.us-west-2.amazonaws.com/production/sites'
		myheaders = { 'Content-type' : 'application/json' }
		r = requests.post(url, data=json.dumps(body), headers=myheaders)

		#print ('- Create status code: {0}'.format(r.status.code))
		if (r.status_code != requests.codes.ok):
			print(' Create failed: bad status code')
			return False

		jsons = r.json()

		if not isinstance(jsons, str):
			print(' - Create failed ({0})'.format(jsons['errorMessage']))
			#jsonj = json.loads(jsons)
			print(' - JSON: {0}'.format(json.dumps(jsons)))
			return False


		return True

	# create the getters and setters for each of the instance fields
	@property
	def name(self):
		"""Get the name of this site"""
		return self._name

	@name.setter
	def name(self, v):
		"""Set the name of this site"""
		self._name = v

	@property
	def slug(self):
		"""Get the street address of this site"""
		return self._slug

	@slug.setter
	def slug(self, v):
		"""Set the name of this site"""
		self._slug = v

	@property
	def street(self):
		"""Get the street address of this site"""
		return self._street

	@street.setter
	def street(self, v):
		"""Set the street address of this site"""
		self._street = v

	@property
	def city(self):
		"""get the name of the city"""
		return self._city

	@city.setter
	def city(self, v):
		"""set the name of the city"""
		self._city = v

	@property
	def state(self):
		"""get the name of the state"""
		return self._state

	@state.setter
	def state(self, v):
		"""set the name of the state"""
		self._state = v

	@property
	def zipcode(self):
		"""get the name of the zipcode"""
		return self._zipcode

	@zipcode.setter
	def zipcode(self, v):
		"""set the name of the zipcode"""
		self._zipcode = v

	@property
	def latitude(self):
		"""get the name of the latitude"""
		return self._latitude

	@latitude.setter
	def latitude(self, v):
		"""set the name of the latitude"""
		self._latitude = v

	@property
	def longitude(self):
		"""get the name of the longitude"""
		return self._longitude

	@longitude.setter
	def longitude(self, v):
		"""set the name of the longitude"""
		self._longitude = v

	@property
	def opentime(self):
		"""get the name of the opentime"""
		return self._opentime

	@opentime.setter
	def opentime(self, v):
		"""set the name of the opentime"""
		self._opentime = v

	@property
	def closetime(self):
		"""get the name of the closetime"""
		return self._closetime

	@closetime.setter
	def closetime(self, v):
		"""set the name of the closetime"""
		self._closetime = v

	@property
	def days(self):
		"""get the name of the days"""
		return self._days

	@days.setter
	def days(self, v):
		"""set the name of the days"""
		self._days = v

	@property
	def sitecoordinator(self):
		"""get the name of the sitecoordinator"""
		return self._sitecoordinator

	@sitecoordinator.setter
	def sitecoordinator(self, v):
		"""set the name of the sitecoordinator"""
		self._sitecoordinator = v

	@property
	def sitetype(self):
		"""get the name of the sitetype"""
		return self._sitetype

	@sitetype.setter
	def sitetype(self, v):
		"""set the name of the sitetype"""
		self._sitetype = v

# now some test cases

#create a site
sitenew = VitaSite()
sitenew.name = 'Guadalupe Community Center'
sitenew.slug = 'guadalupe-community-center'
sitenew.street = '1801 W Cesar Chavez Blvd'
sitenew.city = 'San Antonio'
sitenew.state = 'TX'
sitenew.zipcode = '78207'
sitenew.latitude = '29.4230749'
sitenew.longitude = '-98.5198977'
sitenew.opentime = '8:30'
sitenew.closetime = '4:30'
sitenew.days = 'mwf'
sitenew.sitecoordinator = 'Rosio'
sitenew.sitetype = 'permanent'
sitenew.is_open = True
createSuccess = sitenew.create()
if createSuccess:
	print('Create successful: {0}'.format(sitenew.name))
else:
	print('Create failed for {0}'.format(sitenew.name))





print('Done.')