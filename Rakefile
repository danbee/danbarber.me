# Including only the changed build task
require 'jekyll'

task default: %w[build]

desc "Build the site"
task :build do
  puts "Deploying for: #{site_url}"
  config = Jekyll.configuration(config_params)
  site = Jekyll::Site.new(config)
  Jekyll::Commands::Build.build site, config
end

def config_params
  if site_url
    { url: site_url }
  else
    {}
  end
end

def site_url
  ENV["DEPLOY_URL"]
end
