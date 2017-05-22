module StaticticHelper
	def translate_status (value)
		case value
		when "NO ANSWER"  
			"Не отвечен"
		when 'ANSWERED'
		    'Отвечен'
		when 'BUSY'
		    'Занят'
		else
		  	'ХЗ'  
		end
	end
end
