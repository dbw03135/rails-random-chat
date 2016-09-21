# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

ActionCable.server.config.disable_request_forgery_protection = true
run Rails.application
