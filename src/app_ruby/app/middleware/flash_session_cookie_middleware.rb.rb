require 'rack/utils'

class FlashSessionCookieMiddleware
  def initialize(app, session_key = '_session_id')
    @app = app
    @session_key = session_key
  end

  def call(env)
    if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
      req = Rack::Request.new(env)
      params = ::Rack::Utils.parse_query(env['QUERY_STRING'])
      env['HTTP_COOKIE'] = [ @session_key, params[@session_key] ].join('=').freeze unless params[@session_key].nil?
    end
    @app.call(env)
  end
end

require 'rack/utils'

#class FlashSessionCookieMiddleware
#  def initialize(app, session_key = '_session_id')
#    @app = app
#    @session_key = session_key
#  end
#
#  def call(env)
#    if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
#      req = Rack::Request.new(env)
#      env['HTTP_COOKIE'] = [ @session_key, ::Rack::Utils.escape(req.params[@session_key]) ].join('=').freeze unless req.params[@session_key].nil?
#      env['HTTP_ACCEPT'] = "#{req.params['_http_accept']}".freeze unless req.params['_http_accept'].nil?
#    end
#
#    @app.call(env)
#  end
#end