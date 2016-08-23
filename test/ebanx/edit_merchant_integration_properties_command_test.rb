require_relative '../test_helper'

describe Ebanx::Command::EditMerchantIntegrationProperties do
  before do
    @params = {
      image: 'iVBORw0KGgoAAAANSUhEUgAAAM0AAAD
         NCAMAAAAsYgRbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5c
         cllPAAAABJQTFRF3NSmzMewPxIG//ncJEJsldTou1jHgAAAARBJREFUeNrs2EEK
         gCAQBVDLuv+V20dENbMY831wKz4Y/VHb/5RGQ0NDQ0NDQ0NDQ0NDQ0NDQ
         0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0PzMWtyaGhoaGhoaGhoaGhoaGhoxtb0QGho
         aGhoaGhoaGhoaGhoaMbRLEvv50VTQ9OTQ5OpyZ01GpM2g0bfmDQaL7S+ofFC6x
         v3ZpxJiywakzbvd9r3RWPS9I2+MWk0+kbf0Hih9Y17U0nTHibrDDQ0NDQ0NDQ0
         NDQ0NDQ0NTXbRSL/AK72o6GhoaGhoRlL8951vwsNDQ0NDQ1NDc0WyHtDTEhD
         Q0NDQ0NTS5MdGhoaGhoaGhoaGhoaGhoaGhoaGhoaGposzSHAAErMwwQ2HwRQ
         AAAAAElFTkSuQmCC',
      url_response: 'http://portquiz.net/',
      url_status_change_notification: 'http://portquiz.net/'
    }
  end

  it "can't run without arguments" do
    lambda { ebanx.do_edit_merchant_integration_properties }.must_raise ArgumentError
  end

  it "can't run with invalid base64" do
    params = @params.clone
    params.delete(:url_response)
    params.delete(:url_status_change_notification)

    params[:image] = 'iVBORw0KGgoAAAANSUhEUgAAAM0AAAD'

    lambda { ebanx.do_edit_merchant_integration_properties params }.must_raise ArgumentError
  end

  it "can't run with invalid url_response" do
    params = @params.clone
    params.delete(:image)
    params.delete(:url_status_change_notification)

    params[:url_response] = 'http://foo.bar'

    lambda { ebanx.do_edit_merchant_integration_properties params }.must_raise ArgumentError
  end

  it "performs a successful merchant integration properties" do
    response = ebanx.do_edit_merchant_integration_properties @params
    response.http_code.must_equal 200
    response.response['status'].must_equal 'SUCCESS'
    response.response['body']['url_response'].must_equal @params[:url_response]
    response.response['body']['url_status_change_notification'].must_equal @params[:url_status_change_notification]
  end
end