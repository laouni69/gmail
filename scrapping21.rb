require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'tempfile'

def get_the_email_of_a_townhal_from_its_webpage(url)
	
	doc = Nokogiri::HTML(open(url))
	doc.xpath('.//*[@class="lientxt"]/@href').each do |node|
		begin
		url = ("http://annuaire-des-mairies.com")+ (node.text[1..-1])
		
		doc = Nokogiri::HTML(open(url))
		mail = doc.css('font')[29].text
		ville = doc.css('h1').text

		table = [ville, mail]
		p table

		rescue OpenURI::HTTPError => e
 
		end
	end
end
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or.html")
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-2.html")
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-3.html")
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-4.html")
