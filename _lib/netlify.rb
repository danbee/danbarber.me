module Netlify
  def self.site_url
    if production?
      ENV["URL"]
    else
      ENV["DEPLOY_URL"]
    end
  end

  private

  def self.production?
    ENV["CONTEXT"] == "production"
  end
end
