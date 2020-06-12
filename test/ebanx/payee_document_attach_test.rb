require_relative '../test_helper'

describe Ebanx::Command::PayeeDocumentAttach do
  it "can't run without arguments" do
    lambda { ebanx.do_payee_document_attach }.must_raise ArgumentError
  end
end
