module FlipkartSeller
	module Order

		def fetch_orders
			orders = []
			response = send_order_request

			if response.code == 200
				response_data = JSON.parse(response.body)
				orders = response_data["orderItems"]
				while response_data["hasMore"]
					response = JSON.parse(send_order_request(response_data["nextPageUrl"]))
					if response.code == 200
						response_data = JSON.parse(response.body)
						orders = orders + response_data["orderItems"]
					end
				end

				return orders
			end
			
		end

		def send_order_request(next_page_url=nil)
			url = "#{@base_url}/sellers" + (next_page_url.blank? ? "/orders/search" : next_page_url)
			request_method = next_page_url.blank? ? :post : :get
		    response = (RestClient::Request.execute(
		      :method => request_method,
		      :url => url,
		      :payload => '{"filter" : {}}',
		      :headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'}
		    ))
		end


	end
end