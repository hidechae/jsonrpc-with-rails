class Rpc::Error::MethodNotFound < Rpc::Error::Base
  def initialize(message: '', data: nil)
    @code    = METHOD_NOT_FOUND
    @message = message
    @data    = data
  end
end
