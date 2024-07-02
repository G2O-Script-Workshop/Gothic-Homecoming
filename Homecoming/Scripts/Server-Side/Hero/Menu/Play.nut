PlayButtonMessage.bind(function(pid, message){
	Player(pid, {
		name = message.charaName,
		visual = [
			message.visBodyM,
			message.visBodyT,
			message.visHeadM,
			message.visHeadT
		],
		walk = message.walk,
		scale = message.height,
		fatness = message.fatness
	});
});