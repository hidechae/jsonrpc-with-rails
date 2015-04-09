class Rpc::Error::InternalError < Rpc::Error::Base
  def initialize(message: '', data: nil)
    @code    = INTERNAL_ERROR
    @message = message
    @data    = data
  end
end
