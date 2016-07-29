require_relative 'wrata_api/wrata_api_request'
require_relative 'wrata_api/server_methods'
require_relative 'wrata_api/queue_methos'
require 'json'
require 'logger'
require 'uri'
require 'yaml'
module WrataApi
  # Class for working with wrata api
  class WrataApi
    include WrataApiRequest
    include ServerMethods
    include QueueMethods

    def initialize
      config = YAML.load_file("#{ENV['HOME']}/.gem-wrata/config.yaml")
      @uri = config['uri']
      @cookie = config['cookie']
      @wrata_session = config['wrata_session']
      @csrf_token = config['csrf_token']
      @logger = Logger.new(STDOUT)
    end
  end
end
