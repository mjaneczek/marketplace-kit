require 'json'
require 'listen'
require 'faraday'
require 'io/console'
require 'deep_merge/rails_compat'
require 'colorize'

require 'marketplace_kit/services/loggable'
require 'marketplace_kit/services/logger'
require 'marketplace_kit/version'
require 'marketplace_kit/command_dispatcher'
require 'marketplace_kit/errors/api_error'
require 'marketplace_kit/errors/marketplace_error'
require 'marketplace_kit/services/user_authentication'
require 'marketplace_kit/services/args_parser'
require 'marketplace_kit/services/config'
require 'marketplace_kit/services/api_driver'
require 'marketplace_kit/services/api_gateway'
require 'marketplace_kit/commands/base_command'
require 'marketplace_kit/commands/base_authorized_command'
require 'marketplace_kit/commands/sync'
require 'marketplace_kit/commands/deploy'
require 'marketplace_kit/commands/pull'
require 'marketplace_kit/commands/show_version'
require 'marketplace_kit/commands/show_help'

module MarketplaceKit
  MARKETPLACE_BUILDER_FOLDER = 'marketplace_builder'.freeze

  def self.root
    File.dirname __dir__
  end

  def self.builder_folder
    "#{Dir.getwd}/#{MARKETPLACE_BUILDER_FOLDER}/"
  end

  def self.config
    @config ||= Services::Config.new
  end

  def self.logger
    @logger ||= Services::Logger.new
  end
end
