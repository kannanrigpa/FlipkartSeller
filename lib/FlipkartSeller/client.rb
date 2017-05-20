module FlipkartSeller
	class Client < Base
		
		def initialize(client_id,client_secret,environment= :production)

			return false unless [:production,:sandbox].include?(environment)

			begin
			  @environment = environment

		      @base_url = @environment.eql?(:production) ? PRODUCTION_BASE_URL : SANDBOX_BASE_URL

	          response = RestClient::Request.execute(
	                  method: :get, 
	                  url: "#{@base_url}/oauth-service/oauth/token",
	                  user: client_id,
	                  password:client_secret, 
	                  timeout: 10,
	                  headers: {params: {:grant_type=> "client_credentials", :scope=> "Seller_Api"}}
	                  )

	            response_hash =  JSON.parse(response.body)
	            @access_token = response_hash["access_token"]


	        rescue RestClient::ExceptionWithResponse => e
		        raise StandardException.new if e.response.blank?

		        if e.response.code.present? && [400,403,404,500,503,599].include?(e.response.code)
		          case e.response.code
		            when 400
		              raise BadRequest.new(e.response), e.message
		            when 403
		              raise Forbidden.new(e.response), e.message
		            when 404
		              raise NotFound.new(e.response), e.message
		            when 500
		              raise InternalServerError.new(e.response), e.message
		            when 503
		              raise ServiceUnavailable.new(e.response), e.message
		            when 599
		              raise ConnectionTimedOut.new(e.response), e.message
		            else
		              raise OtherException.new(e.response), e.message
		            end
		        else
		          raise OtherException.new(e.response), e.message
		        end
		    rescue Exception => e
		          raise StandardException.new
		    end
		end

	end
end