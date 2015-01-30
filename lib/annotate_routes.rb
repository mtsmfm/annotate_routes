require "annotate_routes/version"

module AnnotateRoutes
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require 'annotate_routes/tasks'
    end
  end
end
