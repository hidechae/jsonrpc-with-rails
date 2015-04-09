class Rpc::Error::ParseError < Rpc::Error::Base
  def initialize(message: '', data: nil)
    @code    = PARSE_ERROR
    @message = message
    @data    = data
  end
end
