require_relative '../test_helper'

describe Ebanx::Command::Cancel do
  it "can't run without arguments" do
    lambda { ebanx.do_cancel }.must_raise ArgumentError
  end
end