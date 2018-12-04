extends Node

export (PackedScene) var Enemy


# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	$PlayerKinematicBody2D.start($StartPosition.position)
	$Timer.start()

	
	

	
func _process(delta):
	pass


func _on_Timer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.position = $EnemyPosition.position