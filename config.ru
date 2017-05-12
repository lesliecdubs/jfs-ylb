require 'rack'
require 'rack/contrib/try_static'
require 'rack/contrib/static_cache'

module Rack
  class FontHeaders
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      response = @app.call(env)
      if request.path =~ /\/(fonts|videos|stylesheets)\//
        # there maybe a better way to add headers
        response[1]["Access-Control-Allow-Origin"] = "*"
      end
      response
    end
  end
end

use Rack::FontHeaders

use Rack::Deflater

use Rack::StaticCache, :urls => ['/images', '/stylesheets', '/javascripts', '/fonts'],
                       :root => "build"

# Serve files from the build directory
use Rack::TryStatic,
  root: 'build',
  urls: %w[/],
  try: ['.html', 'index.html', '/index.html']

run lambda{ |env|
  four_oh_four_page = File.expand_path("../build/404/index.html", __FILE__)
  [ 404, { 'Content-Type'  => 'text/html'}, [ File.read(four_oh_four_page) ]]
}
