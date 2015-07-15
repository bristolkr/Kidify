Devise.setup do |config|
  # config.secret_key = 'cc539a350ff2135fbf0e99754b3567fc73033cdc6eef52df0d0b48801c3b70353d670f73cd31727d17d640fed45a153db1db951a481278fcd8361279ca194aa9'
  config.secret_key = 'd88ffabd6eb9f4849f0fdd192b39ae92ea539c89d850f3bf3621b7bbb23858db8117a46452d8fa6dcea2d1374c3def37473d1108040974fdb175655b8699e132'

  # ==> Mailer Configuration
  config.mailer_sender = 'no-reply@kidify.com'

  # Configure the class responsible to send e-mails.
  config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.authentication_keys = [:email]

  # Configure parameters from the request object used for authentication. Each entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. For instance,
  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
  # The same considerations mentioned for authentication_keys also apply to request_keys.
  # config.request_keys = []

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.params_authenticatable = true
  config.http_authenticatable_on_xhr = true
  config.http_authentication_realm = 'Application'
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  # config.pepper = '68d6dbcb77d7e3b8c55622479172e7eaa7254b4a25f870494bfa089ee0e62f0efe6a9a27471baa8da39dbddaf82048654f7ed1bc9790ceb3b563873f162ec75e'

  # ==> Configuration for :invitable
  config.invite_for = 2.weeks
  config.invitation_limit = 8
  config.invite_key = {:email => /\A[^@]+@[^@]+\z/}
  config.invite_key = {:email => /\A[^@]+@[^@]+\z/, :username => nil}
  config.validate_on_invite = true
  config.resend_invitation = true

  # The class name of the inviting model. If this is nil,
  # the #invited_by association is declared to be polymorphic.
  # Default: nil
  # config.invited_by_class_name = 'User'

  # The column name used for counter_cache column. If this is nil,
  # the #invited_by association is declared without counter_cache.
  # Default: nil
  # config.invited_by_counter_cache = :invitations_count

  config.allow_insecure_sign_in_after_accept = false

  # ==> Configuration for :confirmable
  config.allow_unconfirmed_access_for = 0.days
  config.confirm_within = 3.days
  config.reconfirmable = true
  config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  config.remember_for = 1.weeks
  config.expire_all_remember_me_on_sign_out = true
  config.extend_remember_period = false

  # ==> Configuration for :validatable
  config.password_length = 8..72

  # Email regex used to validate email formats.
  config.email_regexp = /\A[^@]+@[^@]+\z/

  # ==> Configuration for :timeoutable
  config.timeout_in = 60.minutes

  # If true, expires auth token on session timeout.
  config.expire_auth_token_on_timeout = false

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.maximum_attempts = 10
  config.unlock_in = 1.hour
  config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  config.sign_in_after_reset_password = true

  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.
  # config.scoped_views = false

  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes (usually :user).
  # config.default_scope = :user

  # Set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. By default, Devise signs out all scopes.
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  config.navigational_formats = ['*/*', :html]
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

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
