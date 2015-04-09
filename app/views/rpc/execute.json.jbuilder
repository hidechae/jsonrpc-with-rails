json.extract! @response, :id, :jsonrpc

if @response[:error] == 0
  json.extract! @response, :result, :error
else
  json.error do
    json.extract! @response[:error], :code, :message, :data
  end
end
