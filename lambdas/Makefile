.PHONY: test publish zips clean

test:
	python3 -m unittest discover --pattern "tc_*.py"

get_site_details.zip: functions/GetSiteDetails.py models/site.py config/configs.py
	zip $@ $^

vita_apis.zip: functions/api_handler.py models/site.py models/user.py models/session.py
	zip $@ $^

site_json_compiler.zip: functions/site_content_compiler.py models/site.py
	zip $@ $^

zips: get_site_details.zip site_json_compiler.zip vita_apis.zip

publish: zips
#	aws lambda update-function-code --function-name vita-site-json-lambda --zip-file fileb://site_json_compiler.zip
	aws lambda update-function-code --function-name GetSiteDetails --zip-file fileb://get_site_details.zip

clean:
	rm -f *.zip
