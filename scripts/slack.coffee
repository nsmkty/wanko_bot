#scripts/slack.coffee

module.exports = (robot) ->
	robot.hear /わんこ/i, (msg) ->
		username = msg.message.user.name
		msg.send username + "さん、呼んだわん？"

	robot.hear /お手！$/, (msg) ->
		msg.send "わん！"
	robot.hear /おかわり！$/, (msg) ->
		msg.send "わん！"
		