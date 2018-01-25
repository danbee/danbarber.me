# Including only the changed build task
require 'jekyll'

task default: %w[build]

desc "Build the site"
task :build do
  config = Jekyll.configuration(config_params)
  site = Jekyll::Site.new(config)
  Jekyll::Commands::Build.build(site, config)
end

def config_params
  { url: site_url }
end

def site_url
  if production?
    ENV["URL"]
  else
    ENV["DEPLOY_URL"]
  end
end

def production?
  ENV["CONTEXT"] == "production"
end
