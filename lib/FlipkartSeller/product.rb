module FlipkartSeller
	module Product

		def get_product(sku)

			begin

			  response = RestClient::Request.execute(
                		:method => :get,
                		:url => "#{@base_url}/sellers/skus/#{sku}/listings",
                		:headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'}
              			)

        response_data =  JSON.parse(response.body)
        return response_data


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
                		:url => "#{@base_url}/sellers/skus/listings/bulk",
                		:headers => {'Authorization' => 'Bearer ' + @access_token, :content_type => 'application/json'},
                		:payload=> "#{data.to_json}"
              			)

        response_data =  JSON.parse(response.body)

        return response_data

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