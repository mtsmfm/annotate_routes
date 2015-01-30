module AnnotateRoutes
  class RouteWrapper
    attr_reader :info, :reqs

    def initialize(route_str)
      if route_str =~ /(.*) +([^[:upper:]]+#[^[:upper:]]+)\n/
        @info = $1.strip.split(' ')
        @reqs = $2
      end
    end
  end
end
