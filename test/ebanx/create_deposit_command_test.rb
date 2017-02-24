require_relative '../test_helper'

describe Ebanx::Command::DepositCreate do
  it "gets EBANX Exception for Invalid Amount" do
    err = lambda { ebanx.do_deposit_create({amount: "AAAA"}) }.must_raise EbanxApiException
    assert_equal('Invalid amount', err.message)
  end

  it "can't run without arguments" do
    lambda { ebanx.do_deposit_create }.must_raise ArgumentError
  end
end
