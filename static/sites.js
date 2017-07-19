
$.getJSON("https://console.aws.amazon.com/s3/object/vitasa-static-content-dev/sites.json?crossorigin", function(sites) {
    console.log(sites);
    var template = $('#hidden-site-template').html();
    for (let site of sites) {
        var site_html = $(template).clone();

        $(site_html).find('#xstreet').html(site.xstreet);
        $(site_html).find('#xcit').html(site.xcity);
        $(site_html).find('#xzip').html(site.xzip);
        $(site_html).find('#is_open').html(site.is_open.toString());
        $(site_html).find('#days').html(site.days);
        $(site_html).find('#opentime').html(site.opentime);
        $(site_html).find('#closetime').html(site.closetime);
        
        $('#sites-list').append(site_html);
        
    }
});
