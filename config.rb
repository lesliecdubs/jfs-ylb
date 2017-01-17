###
# Page options, layouts, aliases and proxies
###

# Page Processing
require 'slim'

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

# Use Webpack as external pipeline
activate :external_pipeline,
         name: :webpack,
         command: build? ? "npm run build" : "npm start",
         source: ".tmp/dist",
         latency: 1

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

  case ENV['TARGET'].to_s.downcase
  when 'production'
   config[:host] = "http://www.mydomain.com"
   activate :robots,
                rules: [{ user_agent: '*', allow: %w(/)}],
                sitemap: "http://#{@config[:host]}/sitemap.xml"
  else
    config[:host] = "localhost:4567"
    activate :robots,
                 rules: [{ user_agent: '*', disallow: %w(/)}],
                 sitemap: "http://#{config[:host]}/sitemap.xml"
  end
end
