require_relative '../test_helper'

describe Ebanx::Command::PayoutCommit do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_commit }.must_raise ArgumentError
  end
end
