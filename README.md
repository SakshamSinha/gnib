# Stamp 1G Monitor Script

This project is aimed to monitor the available stamp 1G slot every 2.5 seconds, automatically, which is easy but very useful.

### Update on 6th Feb 2019
+ I'm happy that some people are still interested in this small script even in 2019. When testing the code today, I found the Irish Naturalisation and Immigration Service added a Google verification box before calling the API, so we have to click the Google verification box on the webpage and get the token firstly, and then replace the token at the end of the URL in the gnib.rb code. So this script can still save some clicking effort for hours.

### Appointment Form
+ Url: https://burghquayregistrationoffice.inis.gov.ie/Website/AMSREG/AMSRegWeb.nsf/AppSelect?OpenForm
+ You need to fill the form in advance.

### Window
+ According to history monitoring, there are 2 time window: **around 10am - 10.30am** and **around 2.30pm**

### Implementation Details
The implementation is based on Ruby only

### Setup
You just need to make sure you have [Ruby](https://www.ruby-lang.org/en/) installed in your system.

### Start
+ Go to Gnib folder.
+ Run `ruby gnib.rb` in the terminal
+ Once there is any available Stamp 1G, you should hear some **bi bi bi** noise on your computer.
+ Once we get any slots we still need to do some manual work to pass the Google Verification code.

### For Email support-
If you are using 2 Factor Authentication

You need to create an app specific password for your application. Follow these steps:

+ Go to gmail
+ in the top right corner click on your profile icon and select 'My Account'
+ Click on 'Sign in & Security'
+ Scroll down the 'Sign in & Security' page a bit and there is a section called 'App Passwords' Click on that.
+ You should see a dropdown labelled 'Select App'. Select Mail.
+ For the 'on my device' dropdown select 'Other' and type in commandline or whatever you want to call the app.

Click 'Generate'. A password will be generated. Copy that password and replace the password you were using in your options hash with the generated password:
    options = { :address => "smtp.gmail.com", :port => 587, :user_name => '', :password => '', :authentication => 'plain', :enable_starttls_auto => true }

Also make sure your username is your full gmail email address.
