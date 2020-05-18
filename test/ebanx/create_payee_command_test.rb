require_relative '../test_helper'

describe Ebanx::Command::PayeeCreate do
  it "can't run without arguments" do
    lambda { ebanx.do_payee_create }.must_raise ArgumentError
  end
end
