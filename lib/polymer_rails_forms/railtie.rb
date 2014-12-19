require 'polymer-rails-forms'
require 'rails'
module PolymerRailsForms
  class Railtie < Rails::Railtie
    railtie_name :polymer_rails_forms

    rake_tasks do
      load "tasks/install.rake"
    end
  end
end