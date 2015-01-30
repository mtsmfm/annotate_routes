require 'annotate_routes/exceptions'

module AnnotateRoutes
  class Annotator
    COMMENT = '== Route Info'.freeze

    def initialize(root, route)
      @root = root
      @reqs = route.fetch(:reqs)
      @info = route.fetch(:info)
    end

    def annotate!
      raise ControllerNotFound.new(controller_file_path) unless File.exists?(controller_file_path)

      File.open(controller_file_path, 'r+') do |f|
        body = f.read

        raise ActionNotFound.new(@reqs) unless body =~ /def #{action}\W/

        new_body = body.gsub(/(?:^ *# #{COMMENT}\n(?: *#.*\n)+)?( *def #{action}\W)/, comment + "\\1")

        f.rewind
        f.write(new_body)
      end
    end

    def comment
      ["#{COMMENT}", *@info.map {|i| i.join(' ')} ].map {|c| "  # " + c }.join("\n") + "\n"
    end

    def controller_file_path
      @root.join("app/controllers/#{controller}_controller.rb")
    end

    def controller
      @controller ||= @reqs.split('#').first
    end

    def action
      @action ||= @reqs.split('#').last
    end
  end
end
