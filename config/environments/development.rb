Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  # config.relative_url_root = "/v1"
  config.cache_classes = true 

  # Do not eager load code on boot.
  config.eager_load = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  # config.serve_static_assets = false

  # config.assets.js_compressor = :uglifier

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  # config.assets.compile = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Print deprecation notices to the Rails logger.
  #CAMBIO
  #config.active_support.deprecation = :log
  config.active_support.silenced = true
  config.log_level = :fatal
  #FIN-CAMBIO

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = false # ANTES ERA :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = false

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

end
