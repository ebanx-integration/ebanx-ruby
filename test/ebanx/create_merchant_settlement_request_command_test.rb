require_relative '../test_helper'

describe Ebanx::Command::CreateMerchantSettlementRequest do
  before do
    @params = {
      from_name: 'João da Silva',
      from_email: 'joao@mailinator.com',
      message: 'Olá'
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_create_merchant_settlement_request }.must_raise ArgumentError
  end

  it "can't run with invalid from_email" do
    params = @params.clone
    params.delete(:from_name)
    params.delete(:message)

    params[:from_email] = '...'

    lambda { ebanx.do_create_merchant_settlement_request params }.must_raise ArgumentError
  end

  it "can't run with too long message" do
    params = @params.clone
    params.delete(:from_name)
    params.delete(:from_email)

    params[:message] = [*('A'..'Z')].sample(1025).join

    lambda { ebanx.do_create_merchant_settlement_request params }.must_raise ArgumentError
  end

  it 'performs a successful request' do
    response = ebanx.do_create_merchant_settlement_request @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end