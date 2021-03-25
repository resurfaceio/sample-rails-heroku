# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'resurfaceio/all'

use HttpLoggerForRack,
  url: 'http://localhost:4001/message',
  rules: 'include debug'

run Rails.application
