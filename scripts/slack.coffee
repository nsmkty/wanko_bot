#scripts/slack.coffee

gm = require("googlemaps");

module.exports = (robot) ->
	robot.hear /わんこ/i, (msg) ->
		username = msg.message.user.name
		msg.send "@" + username + "さん、呼んだわん？"

	robot.hear /お手！$/, (msg) ->
		msg.send "わん！"
	robot.hear /おかわり！$/, (msg) ->
		msg.send "わん！"
	
	# GoogleMAPの画像出力
	robot.respond /(.+)の(地図|ちず|map|MAP)を(だ|出)して/i, (msg) ->
		markers = [location: msg.match[1]]
		output = gm.staticMap(msg.match[1], 14, "1000x800", false, false, "roadmap", markers)
		msg.send output
