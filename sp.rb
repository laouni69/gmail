require 'bundler'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'google_drive'
require 'json'


def send_drive(array)
session = GoogleDrive::Session.from_config("config.json")

spreadsheet = session.spreadsheet_by_key("1o0ExvFQlkGRoFJaqKW7_8wayxM5Wz3fqtuW1KcLpCwk")

worksheet = spreadsheet.worksheets.first

worksheet.insert_rows(worksheet.num_rows + 1, [[array[0], array[1]]])
worksheet.save


end

def get_the_email_of_a_townhal_from_its_webpage(web)
	doc = Nokogiri::HTML(open(web))
	doc.xpath('.//*[@class="lientxt"]/@href').each do |node|
		begin

	url = ("http://annuaire-des-mairies.com"+ (node.text[1..-1]))

	doc = Nokogiri::HTML(open(url))
	mail = doc.css('font')[29].text
	ville = doc.css('h1').text
	
table = [ville, mail]
	p table
send_drive(table)

rescue OpenURI::HTTPError => e
end
end
end

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or.html")

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-2.html")

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-3.html")

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/cote-d-or-4.html")
