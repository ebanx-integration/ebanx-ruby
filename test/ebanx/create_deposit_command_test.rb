require_relative '../test_helper'

describe Ebanx::Command::DepositCreate do
  it "can't run without arguments" do
    lambda { ebanx.do_deposit_create }.must_raise ArgumentError
  end
end
