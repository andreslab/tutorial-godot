extends Node

export (int) var max_hp = 12
export (int) var strenght = 8
export (int) var magic = 8

export (int) var level = 1

var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)

#formula de poder del jugador
#a * x + x^b + 10
#10: valor inicial
#b: puntos obtenidos
#a : nivel (cuando llega a cierta cantidad de puntos "b" aumenta)

#formula de poder del enemigo
#a * x + x^b
#sin el 10 porque al inicio debe haber una leve diferencia para iniciar

func get_required_experience(level):
	return round(pow(level, 1.8) + level * 4)
	
func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()
		
func level_up():
	level +=1
	experience_required = get_required_experience(level + 1)
	
	var stats = ['max_hp','strenght','magic']
	var random_stats = stats[randi() % stats.size()]
	set(random_stats, get(random_stats) + randi() % 4 + 2)