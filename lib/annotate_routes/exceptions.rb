module AnnotateRoutes
  class ControllerNotFound < StandardError
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def message
      "No such controller - #{file}"
    end
  end

  class ActionNotFound < StandardError
    attr_reader :reqs

    def initialize(reqs)
      @reqs = reqs
    end

    def message
      "No such action - #{reqs}"
    end
  end
end
