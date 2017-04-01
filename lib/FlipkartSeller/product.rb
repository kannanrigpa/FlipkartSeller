module FlipkartSeller
	module Product

		def get_product(sku)

			begin

			  response = RestClient::Request.execute(
                		:method => :get,
                		:url => "#{@base_url}/sellers/skus/#{sku}/listings",
                		:headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'}
              			)

              if response.code == 200
                response_data =  JSON.parse(response.body)

                return response_data
              end

            rescue Exception => e
            	Rails.logger.error e.message
            end

		end

		def update_product(sku,data)

			begin

			  response = RestClient::Request.execute(
                		:method => :post,
                		:url => "#{@base_url}/sellers/skus/#{sku}/listings",
                		:headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'},
                		:payload=> "#{data.to_json}"
              			)

              if response.code == 200
                response_data =  JSON.parse(response.body)

                return response_data
              end

            rescue Exception => e
            	Rails.logger.error e.message
            end

		end

		def update_products(data)

			begin

			  response = RestClient::Request.execute(
                		:method => :post,
                		:url => "#{BASE_URL}/sellers/skus/listings/bulk",
                		:headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'},
                		:payload=> "#{data.to_json}"
              			)

              if response.code == 200
                response_data =  JSON.parse(response.body)

                return response_data
              end

            rescue Exception => e
            	Rails.logger.error e.message
            end

		end
	end
end