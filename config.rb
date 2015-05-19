require 'coffee-script'

case ENV['TARGET'].to_s.downcase
when 'production'
  @DOMAIN_ROOT_URL = "www.mydomain.com"
else
  @DOMAIN_ROOT_URL = "localhost:4567"
end

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
page "/sitemap.xml", layout: false

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :i18n

# Clean URLs
activate :directory_indexes

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-XXXXXXX-X' # Replace with your property ID.
end

case ENV['TARGET'].to_s.downcase
when 'production'
  activate :s3_sync do |s3_sync|
    s3_sync.bucket                = 'S3_BUCKET_NAME'
    s3_sync.aws_access_key_id     = 'AWS_ACCESS_KEY_ID'
    s3_sync.aws_secret_access_key = 'AWS_SECRET_ACCESS_KEY'
  end

  activate :cloudfront do |cf|
    cf.access_key_id     = 'ACCESS_KEY_ID'
    cf.secret_access_key = 'SECRET_ACCESS_KEY'
    cf.distribution_id   = 'DISTRIBUTION_ID'
    cf.filter            = /\.html$/i
  end
else
  activate :s3_sync do |s3_sync|
    s3_sync.bucket                = 'S3_BUCKET_NAME'
    s3_sync.aws_access_key_id     = 'AWS_ACCESS_KEY_ID'
    s3_sync.aws_secret_access_key = 'AWS_SECRET_ACCESS_KEY'
  end

  activate :cloudfront do |cf|
    cf.access_key_id     = 'ACCESS_KEY_ID'
    cf.secret_access_key = 'SECRET_ACCESS_KEY'
    cf.distribution_id   = 'DISTRIBUTION_ID'
    cf.filter            = /\.html$/i
  end
end

after_s3_sync do |files_by_status|
  invalidate files_by_status[:updated]
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, ignore: /.svg$/

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :gzip

  activate :imageoptim

  case ENV['TARGET'].to_s.downcase
  when 'production'
    activate :robots,
             rules: [{ user_agent: '*', allow: %w(/)}],
             sitemap: "http://#{@DOMAIN_ROOT_URL}/sitemap.xml"
  else
    activate :robots,
             rules: [{ user_agent: '*', disallow: %w(/)}],
             sitemap: "http://#{@DOMAIN_ROOT_URL}/sitemap.xml"
  end
end
