require 'bundler'
Bundler.require


# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copie de Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }

def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/cote-d-or.html"))
	doc.xpath('.//*[@class="lientxt"]/@href').each do |node|
	url = ("http://annuaire-des-mairies.com"+ (node.text[1..-1]))

	doc = Nokogiri::HTML(open(url))
	mail = doc.css('font')[29].text
	ville = doc.css('h1').text
	
table = [ville, mail]
	p table

end
end

get_all_the_urls_of_val_doise_townhalls