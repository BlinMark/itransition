# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.secret_key = '64440d89721bc47c271a46ba157a9bfef4cd660bb04527f9ca7560b5440d0835d8f062da942033f62ff8976dd2e8d28ad7c3ed4810e8de50f15d2b58e54db99f'


  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'


  require 'devise/orm/active_record'


  config.case_insensitive_keys = [:email]


  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]


  config.stretches = Rails.env.test? ? 1 : 11


  config.reconfirmable = true


  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128


  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/


  config.reset_password_within = 6.hours


  config.sign_out_via = :delete

  config.omniauth :facebook, '346335805399670', 'e82b27a60af023a11ae57a1d28ddf666', scope: 'public_profile,email'
  config.omniauth :twitter, 'RUrDZ6vc1B1aN6DigbmMZ59jq', '4Q8vSTb63iFAWP8jJ8bkUDYn6SnDCpzWKmhZR5hOAntgJIc5ps'
  config.omniauth :vkontakte, '6491516', '35c360e335c360e335c360e3ed35a06d9f335c335c360e36ec91ce11c073310a3a3ccbe', scope: 'public_profile,email', display: 'page'

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth_callbacks :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
