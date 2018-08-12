module Netlify
  def self.site_url
    if production?
      ENV["URL"]
    else
      ENV["DEPLOY_URL"]
    end
  end

  def self.production?
    context == "production"
  end

  def self.context
    ENV["CONTEXT"]
  end
end
