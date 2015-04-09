# jsonrpc-with-rails

This is JSON-RPC API server with Ruby on Rails4.

# test script

Send post request like following.

```
require 'net/http'
require 'uri'
require 'json'
require 'pp'

URL = 'http://localhost:3000'
uri = URI.parse(URL)

request = Net::HTTP::Post.new(uri.request_uri)
json = {
  id:       '12345',
  jsonrpc:  '2.0',
  method:   'user/get',
  params:   { id: 1 }
}.to_json
request.body = 'payload=' + json

http = Net::HTTP.new(uri.host, uri.port)

http.start do |h|
  response = h.request(request)
  pp JSON.parse(response.body)
end
```

Response is following.

```
{"id"=>"12345",
 "jsonrpc"=>"2.0",
 "result"=>{"id"=>1, "name"=>"user1"},
 "error"=>0}
```
