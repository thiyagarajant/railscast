Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '104235243082026', 'a475365501cfee9413261ceb09d453f3'
  provider :google,    '184212592617.apps.googleusercontent.com', 'cnWmczLA3hi6fIhOiU4SAcXW'
  
end