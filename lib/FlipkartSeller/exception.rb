module FlipkartSeller

  class Exception < StandardError; end

  class BadRequest < Exception; end #for 400 response

  class Forbidden < Exception; end #for 403 response

  class NotFound < Exception; end #for 404 response

  class InternalServerError < Exception; end # for 500 response

  class ServiceUnavailable < Exception; end # for 503 response

  class ConnectionTimedOut < Exception; end # for 599 response
  
end