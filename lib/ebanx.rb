require 'rest-client'
require 'json'

require_relative 'ebanx/version'
require_relative 'ebanx/dig'
require_relative 'ebanx/response'
require_relative 'ebanx/command/command'
require_relative 'ebanx/command/cancel'
require_relative 'ebanx/command/capture'
require_relative 'ebanx/command/direct'
require_relative 'ebanx/command/document_balance'
require_relative 'ebanx/command/due_date'
require_relative 'ebanx/command/exchange'
require_relative 'ebanx/command/print'
require_relative 'ebanx/command/get_currency_rates'
require_relative 'ebanx/command/get_merchant_integration_properties'
require_relative 'ebanx/command/edit_merchant_integration_properties'
require_relative 'ebanx/command/query'
require_relative 'ebanx/command/refund'
require_relative 'ebanx/command/refund_or_cancel'
require_relative 'ebanx/command/get_merchant_settlement_info'
require_relative 'ebanx/command/get_merchant_settlement_report'
require_relative 'ebanx/command/get_merchant_settlement_statement'
require_relative 'ebanx/command/get_merchant_settlement_extract'
require_relative 'ebanx/command/get_merchant_amount_balance_by_country'
require_relative 'ebanx/command/request'
require_relative 'ebanx/command/resend_payment_notification'
require_relative 'ebanx/command/token'
require_relative 'ebanx/command/zipcode'
require_relative 'ebanx/command/payout_create'
require_relative 'ebanx/command/payout_commit'
require_relative 'ebanx/command/payout_cancel'
require_relative 'ebanx/command/payout_retrieve'
require_relative 'ebanx/command/payout_search'
require_relative 'ebanx/command/payout_simulate'
require_relative 'ebanx/command/payout_balance'
require_relative 'ebanx/command/payout_banks'
require_relative 'ebanx/command/payout_bank_details'
require_relative 'ebanx/command/transfer_create'
require_relative 'ebanx/command/transfer_cancel'
require_relative 'ebanx/command/transfer_commit'
require_relative 'ebanx/command/transfer_retrieve'
require_relative 'ebanx/command/transfer_search'
require_relative 'ebanx/exception/ebanx_api_exception'

module Ebanx
  @test_mode = false
  @user_data = ["SDK-RUBY/" + Ebanx::VERSION]

  class << self
    attr_accessor :integration_key, :test_mode, :parse_response
  end

  def self.base_uri
    if @test_mode
      'https://sandbox.ebanxpay.com/ws/'
    else
      'https://api.ebanxpay.com/ws/'
    end
  end

  protected
  def self.run_command(method, params)
    klass = get_command_class method
    required_params = klass.instance_method(:initialize).parameters.size

    raise ArgumentError if (!params[0] || params[0].length == 0) && required_params != 0

    command = required_params == 0 ? klass.new : klass.new(merge_default_params(klass, params))
    command.valid?

    request command
  end

  def self.merge_default_params(command, params)
    return params if params.empty?
    params = params[0].merge integration_key: @integration_key

    if command.name =~ /Direct$/
      params = params.merge! operation: 'request', mode: 'full'
    end

    params
  end

  def self.request(command)
    uri = self::base_uri + command.request_action

    begin
      case command.request_method
      when :post
        response = RestClient::Request.execute(:method => :post, content_type: command.response_type, :url => uri, :payload => command.params, :timeout => nil, :open_timeout => nil, :headers => self.format_user_data )
      when :get
        response = RestClient.get uri, params: command.params, :headers => self.format_user_data
      else
        raise ArgumentError "Request method #{command.request_method.to_s} is not supported."
      end
    rescue RestClient::ExceptionWithResponse => e
        message = (JSON.parse(e.response)['message'] rescue nil) || e.message
        raise EbanxApiException.new(message, e.response, e.http_code)
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

  def self.add_source_data(source, version)
    @user_data << source + '/' + version
  end

  private
    def self.format_user_data()
      return {'X-Ebanx-Client-User-Agent' => @user_data.join(' ')}
    end
end
