require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "carrierwave"

Bundler.require(*Rails.groups)

module ApiAddicts
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end

class FooInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super.push('text-fields')
  end
end
