require 'nokogiri'
require 'open-uri'

class MovieInfo
	attr_reader :url, :date

	def initialize(url)
		@url = url
	end

	def get_class_items(class)
		data.css(class)
	end

	def data
		@data ||= Nokogir::HTML(open(url))
	end

	# def saving_space
		# doc = Nokogiri::HTML(open(movie))
		# puts doc.at_css("title").text
		# doc.css(".item").each do |item|
		# title = item.at_css(".prodLink").text
		# price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
		# puts "#{title} - #{price}"
		# puts item.at_css(".prodLink")[:href]
	# end

end