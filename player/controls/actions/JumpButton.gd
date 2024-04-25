extends ActionButton

func execute(player: Player):
	player.jump(%JumpDirection.vector);
