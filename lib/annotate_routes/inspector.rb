require 'annotate_routes/route_wrapper'

module AnnotateRoutes
  class Inspector
    def initialize(routes_stream)
      @routes_stream = routes_stream
    end

    def routes
      @routes_stream.each_line
        .map {|l| RouteWrapper.new(l) }
        .select(&:reqs)
        .group_by(&:reqs)
        .map {|reqs, r| {reqs: reqs, info: r.map(&:info)} }
    end
  end
end
