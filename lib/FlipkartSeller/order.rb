module FlipkartSeller
	module Order
		def get_orders
			puts "#{@base_url}/sellers/orders/search"
		end
	end
end