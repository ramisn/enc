# Be sure to restart your server when you modify this file.

Encorenation::Application.config.session_store :cookie_store, key: '_encorenation_session'

require 'action_dispatch/middleware/session/dalli_store'
if Rails.env == "production" 
  Rails.application.config.session_store :dalli_store#, :memcache_server => MemCacheServers #, :namespace => 'sessions', :key => '_foundation_session', :expire_after => 30.minutess
else
  Rails.application.config.session_store :dalli_store        
end 
