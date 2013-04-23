OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '324332184335936', '0777e066b7df913d9445abd71514474e', :client_options => {:ssl => {:verify => false}}
end
