require 'gmail'
require 'google_drive'

def method_name
	
	session = GoogleDrive::Session.from_config("config.json")

	gmail = Gmail.connect("jean.culbien69100@gmail.com", "montana69")

	spreadsheet = session.spreadsheet_by_key("1o0ExvFQlkGRoFJaqKW7_8wayxM5Wz3fqtuW1KcLpCwk")

	ws = spreadsheet.worksheets.first
	puts gmail.logged_in?
    
    tableau1 = ws.rows
	#print tableau1[3]
	tableau1.each do |row|
		puts row[1][1..-1]
		gmail.deliver do
  			to row[1][1..-1]
			subject "Devenir Developpeur"
			html_part do
    			content_type 'text/html; charset=UTF-8'
    			body "<p>Bonjour,</br>
				Je m'appelle Youssef, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.<br>

				Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{row[0]}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{row[0]} !<br>

				Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
  			end
  		end
  		
		
		sleep(0.5)
	end
	#email = gmail.compose do
	#end
end
 
method_name