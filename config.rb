###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Clean URLs
activate :directory_indexes


# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :asset_hash

  # activate :asset_host
  # set :asset_host do
  #   '//YOURDOMAIN.cloudfront.net'
  # end

  activate :gzip

  # config[:host] = "http://www.example.com"
end

activate :external_pipeline,
         name: :webpack,
         command: build? ?
         './node_modules/webpack/bin/webpack.js --bail' :
         './node_modules/webpack/bin/webpack.js --watch -d',
         source: ".tmp/dist",
         latency: 1
