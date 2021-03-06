#scripts/help.coffee

module.exports = (robot) ->
	# Help Command
	robot.respond /help$|(教|おし)えて/i, (msg) ->
		msg.reply """
			何について知りたいですか？
			Helpの後に以下の内容続けて私にMentionsすることで回答しますわん

			[Help CHANNELS] -> チャンネルについての説明を表示します
			[Help DIRECTMESSAGES] -> DMについての説明を表示します
			[Help PRIVATEGROUPS] -> 招待制グループについての説明を表示します
			[Help Mentions] -> メンションについての説明を表示します
			[Help Star] -> スター機能についての説明を表示します

			検索した方が多分早いし詳しく書いてたりしますわん
		"""

	robot.respond /help CHANNELS$/i, (msg) ->
		msg.reply """
			チャンネルはSkype等での部屋になります。
			参加、退出は自由で後から参加した場合も会話の履歴は保持されています。
			#readonly チャンネルは全員が参加、退出はできません。
			また、新しくチャンネルを作るのも容易です。
		"""

	robot.respond /help DIRECTMESSAGES$/i, (msg) ->
		msg.reply """
			Twitter等で実装されている個人とのチャット機能です。
			他の人は見ることができません。個別の相談等にご利用ください
		"""

	robot.respond /help PRIVATEGROUPS$/i, (msg) ->
		msg.reply """
			招待制のチャンネルです。招待された方のみが参加可能です。
			その為、非公開にしたい情報等はこちらをご利用ください。
		"""

	robot.respond /help Mentions$/i, (msg) ->
		msg.reply """
			相手から自分宛の投稿です。自分宛の投稿は[Recent Mentions]に格納されます。
		"""

	robot.respond /help Star$/i, (msg) ->
		msg.reply """
			スターを付けることで[Starred Items]に格納されます。
			後から確認したい時等、ログが流れてしまっても後から探しやすくなっています。
			自身が行わなくてはいけないタスク等にスターをつけておき、完了したものから
			スターを外す運用を行うことでタスク管理が行えます。
		"""