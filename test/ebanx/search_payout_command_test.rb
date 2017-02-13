require_relative '../test_helper'

describe Ebanx::Command::PayoutSearch do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_search }.must_raise ArgumentError
  end
end