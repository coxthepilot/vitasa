.PHONY: test publish zips clean publish_lambdas publish_static_dev

#AWSCLI=aws
AWSCLI=python3 -m awscli
ZIP=python3 -m zipfile -c 

test:
	python3 -m unittest discover

get_site_details.zip: functions/GetSiteDetails.py models/site.py config/configs.py
	$(ZIP) $@ $^

get_list_of_sites.zip: functions/GetListOfSites.py models/site.py config/configs.py
	$(ZIP) $@ $^

create_site.zip: functions/CreateSite.py models/site.py config/configs.py
	$(ZIP) $@ $^

update_site.zip: functions/UpdateSite.py models/site.py config/configs.py
	$(ZIP) $@ $^

delete_site.zip: functions/DeleteSite.py models/site.py config/configs.py
	$(ZIP) $@ $^

site_json_compiler.zip: functions/site_content_compiler.py models/site.py config/configs.py
	$(ZIP) $@ $^

zips: site_json_compiler.zip get_site_details.zip get_list_of_sites.zip create_site.zip update_site.zip delete_site.zip

publish_lambdas: zips
	$(AWSCLI) lambda update-function-code --function-name SiteCompiler --zip-file fileb://site_json_compiler.zip
	$(AWSCLI) lambda update-function-code --function-name GetSiteDetails --zip-file fileb://get_site_details.zip
	$(AWSCLI) lambda update-function-code --function-name GetListOfSites --zip-file fileb://get_list_of_sites.zip
	$(AWSCLI) lambda update-function-code --function-name CreateSite --zip-file fileb://create_site.zip
	$(AWSCLI) lambda update-function-code --function-name UpdateSite --zip-file fileb://update_site.zip
	$(AWSCLI) lambda update-function-code --function-name DeleteSite --zip-file fileb://delete_site.zip

publish_static_dev: static/sites.js static/sites.html
	$(AWSCLI) s3 cp --acl public-read static/sites.js s3://vitasa-static-content-dev/sites.js
	$(AWSCLI) s3 cp --acl public-read static/sites.html s3://vitasa-static-content-dev/sites.html

publish: publish_lambdas publish_static_dev

clean:
	rm -f *.zip
