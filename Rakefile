# Including only the changed build task
require "jekyll"
require "./_lib/netlify"

task default: %w[build]

desc "Build the site"
task :build do
  config = Jekyll.configuration({
    context: Netlify.context,
    production?: Netlify.production?,
    url: Netlify.site_url,
  })
  site = Jekyll::Site.new(config)

  Jekyll::Commands::Build.build(site, config)
end
