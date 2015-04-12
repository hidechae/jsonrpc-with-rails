class RpcController < ApplicationController
  def execute
    dispatcher = Rpc::Dispatcher.new payload
    @response = dispatcher.execute
  end

  private

  def payload
    params.key?(:payload) ? JSON.parse(params[:payload]).deep_symbolize_keys : nil
  end
end
