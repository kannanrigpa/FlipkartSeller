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

	          if response.code == 200

	            response_hash =  JSON.parse(response.body)
	            @access_token = response_hash["access_token"]
	            return true

	          end

	        rescue Exception => e
	        	Rails.logger.error e.message
	          	return false
	        end
		end

	end
end