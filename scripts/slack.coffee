#scripts/slack.coffee

gm = require("googlemaps");

module.exports = (robot) ->
	robot.hear /.*/, (msg) ->
		if 'general' == msg.envelope.room
			msg.send msg.envelope.room
			if robot.adapter.client.getDMByID(userId)?
				robot.send {room: msg.message.user.name}, "##{msg.envelope.room} チャンネルでは発言を控えるわん"
			else
				robot.adapter.client.openDM msg.message.user.name
				setTimeout =>
					robot.send {room: msg.message.user.name}, "##{msg.envelope.room} チャンネルでは発言を控えるわん"
				, 1000
		msg.finish();
	robot.hear /わんこ/i, (msg) ->
		username = msg.message.user.name
		msg.reply "@" + username + "さん、呼んだわん？"
		msg.finish();
	robot.hear /お(手|て)！$/, (msg) ->
		msg.send "わん！"
		msg.finish();
	robot.hear /おかわり！$/, (msg) ->
		msg.send "わん！"
		msg.finish();
	robot.hear /お腹(空|す)いた$/, (msg) ->
		msg.reply msg.random [
			"っ :sushi:",
			"っ :hamburger:",
			"っ :pizza:",
			"っ :meat_on_bone:",
			"っ :poultry_leg:",
			"っ :rice_ball:",
			"っ :rice:",
			"っ :curry:",
			"っ :ramen:",
			"っ :spaghetti:",
			"っ :bread:",
			"っ :fries:",
			"っ :sweet_potato:",
			"っ :oden:",
			"っ :fried_shrimp:",
			"っ :icecream:",
			"っ :shaved_ice:",
			"っ :ice_cream:",
			"っ :doughnut:",
			"っ :cookie:"
		]
		msg.finish();
	robot.hear /((喉|のど)(乾|かわ)いた)$|(お(酒|さけ)(飲|の)みたい)$/, (msg) ->
		msg.reply msg.random [
			"っ :sake:",
			"っ :wine_glass:",
			"っ :cocktail:",
			"っ :beer:",
			"っ :beers:",
		]
		msg.finish();

	# GoogleMAPの画像出力
	robot.respond /(.+)の(地図|ちず|map|MAP)を(だ|出)して/i, (msg) ->
		markers = [location: msg.match[1]]
		output = gm.staticMap(msg.match[1], 14, "1000x800", false, false, "roadmap", markers)
		msg.reply output
