Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'cab9sKyyKDLua18mtLARxA', 'R4saHOS8d3d0JsQcCm4XO4GoQcpI9c4lHkonuoFbCr0'
  provider :facebook, '219032011495636', '1007016ab7572cc1b1908ef8874e9115'
end
