#scripts/slack.coffee

module.exports = (robot) ->
	robot.hear /���/i, (msg) ->
		username = msg.message.user.name
		msg.send username + "����A�Ă񂾂��H"

	robot.hear /����I$/, (msg) ->
		msg.send "���I"
	robot.hear /�������I$/, (msg) ->
		msg.send "���I"
		