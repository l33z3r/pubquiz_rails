OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '339202539580669', '107761c73dbadbf742091f4d7e352575'
end

module OmniAuth
  module Strategies
    class Facebook < OmniAuth::Strategies::OAuth2
      # Automatically set the access token coming from the url. Required for
      # proper PhoneGap support.
      Rails.logger.warn '!!!!!!!!!!!!!!!!!'
      def build_access_token_with_access_token_parameter
        Rails.logger.info 'aaaaaaaaaaaaaaa!!!!!!!!!!!!!!!!!'

        a_token = request.params['access_token']
        if a_token
          ::OAuth2::AccessToken.from_hash(
              client, { 'access_token' => a_token }.update(access_token_options))
        else
          build_access_token_without_access_token_parameter
        end
      end

      alias_method_chain :build_access_token, :access_token_parameter
    end
  end
end