require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Configurações

  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Configurações adicionais omitidas para brevidade

  # Formatação do log
  config.log_formatter = proc do |severity, timestamp, _progname, msg|
    {
      severity: severity,
      timestamp: timestamp,
      message: msg,
      request_id: Thread.current[:request_id]
    }.to_json + "\n"
  end

  # Configuração do cache
  config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'] }

end
