A library for making UserVoice API calls

Example:

    uv = new UserVoice(
      subdomain: 'SUBDOMAIN', 
      key: 'API_KEY', 
      secret: 'SECRET_API_KEY')

    uv.get '/api/v1/search.json', query: 'llamas', (error, response) ->
      console.log response