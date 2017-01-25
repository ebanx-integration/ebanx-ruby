require_relative '../test_helper'

describe Ebanx::Command::ResendPaymentNotification do
  before do
    @params = {
      hash: 'c8f63411007fd3d4a060ae1f0daf54d3'
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_resend_payment_notification }.must_raise ArgumentError
  end

  it "resend notifiction successfully" do
    response = ebanx.do_resend_payment_notification @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
  end
end