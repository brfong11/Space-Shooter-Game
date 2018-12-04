extends Node

export (PackedScene) var Enemy

var enemySpawn

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var killCounter = 0


func _ready():
	$PlayerKinematicBody2D.start($StartPosition.position)
	killCounter = 0
	$Timer.start()

	
func kill_counter():
	killCounter += 1

	
func _process(delta):
	pass


func _on_Timer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	
	randomize()
	enemySpawn = int(rand_range(30,450))
	
	if abs(enemySpawn - $EnemyPosition.global_position.x) < 50:
		enemySpawn = int(rand_range(30,450))
	else:
		$EnemyPosition.global_position.x = enemySpawn
	
	enemy.position = $EnemyPosition.position
	
	if killCounter > 3:
		killCounter = 0
		$Timer.wait_time *= 0.5