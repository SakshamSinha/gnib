require 'mail'
require 'openssl'
require 'json'
require 'resolv-replace'
require 'net/http'

#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# uri = URI('https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/(getAppsNear)?openpage&cat=Work&sbcat=All&typ=Renewal&_=1530172958153')
uri = URI.parse('https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/(getAppsNear)?readform&cat=All&sbcat=All&typ=Renewal&k=AA3C24A27E37C2E1574D3BD43005A70D&p=8B32615A244E4A9A81155957A290D61B')

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'frommy@gmail.com',
            :password             => 'enter 2step authentication custom generated password here',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
	
Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
	to 'sendto@gmail.com'
	from 'frommy@gmail.com'
	subject 'Test 2'
	body 'test 2'
end

while true
	#res = Net::HTTP.get_response(uri)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	res = http.get(uri.request_uri)
	print "\a" if JSON.parse(res.body)["empty"] != "TRUE"
	if JSON.parse(res.body)["empty"] != "TRUE"	
		Mail.deliver do
			to 'sendto@gmail.com'
			from 'frommy@gmail.com'
		  	subject 'Appointment'
			body res.body
		end
	end
	puts res.body
	current_time = Time.new
	puts "At Time : " + current_time.inspect
	sleep 3
end
