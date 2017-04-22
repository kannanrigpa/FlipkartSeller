module FlipkartSeller

  class Exception < StandardError 
	attr_reader :response

    def initialize(response)
      @response = response
    end
  end

  #for 400 response
  class BadRequest < Exception
  	def initialize(response)
      super(response)
    end
  end 

  #for 403 response
  class Forbidden < Exception
  	def initialize(response)
      super(response)
    end
  end

  #for 404 response
  class NotFound < Exception
  	def initialize(response)
      super(response)
    end
  end

  # for 500 response
  class InternalServerError < Exception
  	def initialize(response)
      super(response)
    end
  end

  # for 503 response
  class ServiceUnavailable < Exception
  	def initialize(response)
      super(response)
    end
  end

  # for 599 response
  class ConnectionTimedOut < Exception
  	def initialize(response)
      super(response)
    end
  end 
  
end