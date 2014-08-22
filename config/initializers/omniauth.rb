OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1528673574021577", "72f683b902d9fd676973594d7cbf74c7"
end

module OmniAuth
  module Strategies
    class Facebook < OmniAuth::Strategies::OAuth2
      # Automatically set the access token coming from the url. Required for
      # proper PhoneGap support.
      Rails.logger.warn "!!!!!!!!!!!!!!!!!"
      def build_access_token_with_access_token_parameter
        Rails.logger.info "aaaaaaaaaaaaaaa!!!!!!!!!!!!!!!!!"


        if atoken = request.params['access_token']
          ::OAuth2::AccessToken.from_hash(
              client, { 'access_token' => atoken }.update(access_token_options))
        else
          build_access_token_without_access_token_parameter
        end
      end

      alias_method_chain :build_access_token, :access_token_parameter
    end
  end
end