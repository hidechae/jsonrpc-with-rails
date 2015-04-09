class Rpc::Error::InvalidParams < Rpc::Error::Base
  def initialize(message: '', data: nil)
    @code    = INVALID_PARAMS
    @message = message
    @data    = data
  end
end
