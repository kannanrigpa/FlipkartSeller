module FlipkartSeller
	module Order

		def fetch_orders
			orders = []
			response = send_order_request

			response_data = JSON.parse(response.body)
			orders = response_data["orderItems"]
			while response_data["hasMore"]

				response = send_order_request(response_data["nextPageUrl"])

				response_data = JSON.parse(response.body)
				orders = orders + response_data["orderItems"]

			end

			return orders
			
		end

		def send_order_request(next_page_url=nil)
			begin
				url = "#{@base_url}/sellers" + (next_page_url.nil? ? "/v2/orders/search" : next_page_url)
				request_method = next_page_url.nil? ? :post : :get
			    response = (RestClient::Request.execute(
			      :method => request_method,
			      :url => url,
			      :payload => '{"filter" : {}}',
			      :headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'}
			    ))

			    return response

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