require 'rest-client'
require 'json'

require_relative 'ebanx/version'
require_relative 'ebanx/response'
require_relative 'ebanx/command/command'
require_relative 'ebanx/command/cancel'
require_relative 'ebanx/command/capture'
require_relative 'ebanx/command/direct'
require_relative 'ebanx/command/document_balance'
require_relative 'ebanx/command/due_date'
require_relative 'ebanx/command/exchange'
require_relative 'ebanx/command/print'
require_relative 'ebanx/command/get_merchant_integration_properties'
require_relative 'ebanx/command/edit_merchant_integration_properties'
require_relative 'ebanx/command/query'
require_relative 'ebanx/command/refund'
require_relative 'ebanx/command/refund_or_cancel'
require_relative 'ebanx/command/get_merchant_settlement_info'
require_relative 'ebanx/command/get_merchant_settlement_report'
require_relative 'ebanx/command/get_merchant_settlement_extract'
require_relative 'ebanx/command/create_merchant_settlement_request'
require_relative 'ebanx/command/get_merchant_amount_balance_by_country'
require_relative 'ebanx/command/request'
require_relative 'ebanx/command/token'
require_relative 'ebanx/command/zipcode'

module Ebanx
  @test_mode = false

  class << self
    attr_accessor :integration_key, :test_mode, :parse_response
  end

  def self.base_uri
    if @test_mode
      'https://sandbox.ebanx.com/ws/'
    else
      'https://api.ebanx.com/ws/'
    end
  end

  protected
  def self.run_command(method, params)
    klass = get_command_class method

    raise ArgumentError if !params[0] || params[0].length == 0

    command = klass.new merge_default_params(klass, params)
    command.valid?

    request command
  end

  def self.merge_default_params(command, params)
    params = params[0].merge integration_key: @integration_key

    if command.name =~ /Direct$/
      params = params.merge! operation: 'request', mode: 'full'
    end

    params
  end

  def self.request(command)
    uri = Ebanx::base_uri + command.request_action

    case command.request_method
    when :post
      response = RestClient::Request.execute(:method => :post, content_type: command.response_type, :url => uri, :payload => command.params, :timeout => nil, :open_timeout => nil)
    when :get
      response = RestClient.get uri, params: command.params
    else
      raise ArgumentError "Request method #{command.request_method.to_s} is not supported."
    end

    Ebanx::Response.new response, command.response_type
  end

  def self.method_missing(method, *args, &block)
    if method.to_s =~ /^do_[a-z]+/
      run_command method.to_s, args
    else
      super
    end
  end

  def self.get_command_class(method)
    method = method.gsub /^do_/, ''
    class_name = 'Ebanx::Command::' + method.split('_').map { |w| w.capitalize }.join
    Object.const_get class_name
  end
end
