require 'rake/unicorn/rails/version'

module Rake
  module Unicorn
    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "#{File.dirname(__dir__)}/unicorn.rake"
        end
      end
    end
  end
end
