class Rpc::Dispatcher
  def initialize(request)
    @id      = request.try(:id)
    @jsonrpc = request.try(:jsonrpc)
    @method  = request.try(:method)
    @params  = request.try(:params)
    @result  = {}
    @error   = 0
  end

  def execute
    begin
      fail Rpc::Error::InvalidRequest.new unless valid?
      @result = Object.const_get("#{@method.camelize}Processor").new(@params).execute
    rescue Rpc::Error::Base => e
      @error = error e
    rescue => e
      @error = error Rpc::Error::InternalError.new(message: e.message)
    end

    response
  end

  private

  def valid?
    return false if @jsonrpc != '2.0'
    return false if @method.blank?
    true
  end

  def response
    {
      id:      @id,
      jsonrpc: @jsonrpc,
      result:  @result,
      error:   @error
    }
  end

  def error(e)
    {
      code:    e.code,
      message: e.message,
      data:    e.data
    }
  end
end
