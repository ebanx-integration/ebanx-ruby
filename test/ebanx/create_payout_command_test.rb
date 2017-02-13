require_relative '../test_helper'

describe Ebanx::Command::PayoutCreate do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_create }.must_raise ArgumentError
  end
end