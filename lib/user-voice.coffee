querystring = require('querystring')

{OAuth}     = require('oauth')

class UserVoice
  constructor: ({@subdomain, @key, @secret}) ->
    @url = "https://#{@subdomain}.uservoice.com"
    @oa = new OAuth(
      "#{@url}/oauth/request_token", 
      "#{@url}/oauth/access_token",
      @key,
      @secret,
      "1.0",
      null,
      'HMAC-SHA1')

  get: (path, args, cb) ->
    if typeof(args) == 'function'
      cb = args
      args = {}

    if Object.keys(args).length
      args = querystring.stringify(args)
      if path.indexOf("?") >= 0
        path += "&#{args}"
      else
        path += "?#{args}"

    @oa.get "#{@url}#{path}", '', '', (error, data, response) ->
      cb(error) if error
      cb(null, JSON.parse(data))

module.exports.UserVoice = UserVoice

