if Rails.env.production?
  $like = "ILIKE"
else
  $like = "LIKE"
end

raw_config = File.read("#{Rails.root}/config/app_config.yml")
APP_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
