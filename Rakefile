# Including only the changed build task
require 'jekyll'

task default: %w[build]

desc "Build the site"
task :build do
  config = Jekyll.configuration(config_params)
  site = Jekyll::Site.new(config)
  Jekyll::Commands::Build.build site, config
end

def config_params
  if ENV["URL"]
    { url: ENV["URL"] }
  else
    {}
  end
end
