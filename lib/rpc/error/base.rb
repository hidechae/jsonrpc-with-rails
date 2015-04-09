class Rpc::Error::Base < StandardError
  attr_reader :code, :message, :data

  PARSE_ERROR      = -32_700
  INVALID_REQUEST  = -32_600
  METHOD_NOT_FOUND = -32_601
  INVALID_PARAMS   = -32_602
  INTERNAL_ERROR   = -32_603

  def initialize(message: '', data: nil)
    @message = message
    @data    = data
    fail 'Called abstract class.'
  end
end
