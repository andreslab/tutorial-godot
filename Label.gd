extends Label

func update_text(level, experience, equired_exp):
	text = """ 
		level: %s
		Experience: %s
		Next Level: %s 
	""" % [level, experience, equired_exp]
	