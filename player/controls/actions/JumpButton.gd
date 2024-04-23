extends ActionButton

func execute(player: Player):
	player.stop();
	player.jump(%JumpDirection.vector);
