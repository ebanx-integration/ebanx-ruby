require_relative '../test_helper'

describe Ebanx::Command::DepositSearch do
  it "can't run without arguments" do
    lambda { ebanx.do_deposit_search }.must_raise ArgumentError
  end
end