class Rpc::Error::InvalidRequest < Rpc::Error::Base
  def initialize(message: '', data: nil)
    @code    = INVALID_REQUEST
    @message = message
    @data    = data
  end
end
