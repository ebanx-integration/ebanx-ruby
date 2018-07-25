require_relative '../test_helper'

describe Ebanx::Command::TokenQuery do
  it "can't run without arguments" do
    lambda { ebanx.do_token_query }.must_raise ArgumentError
  end

  it "performs a failed request when token does not exist" do
    response = ebanx.do_token_query token: "UNKNOWN_TOKEN"
    response.http_code.must_equal 200
    response.response['status'].must_equal 'ERROR'
  end

  it "performs a successful request when token exists"
end
