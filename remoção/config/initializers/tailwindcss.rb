Rails.application.config.assets.configure do |env|
  env.register_postprocessor 'text/css', AutoprefixerRails::Processor
end