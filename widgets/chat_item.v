module widgets

import ui
import gx
import messages { Message }

pub fn new_chat_item(message &Message) &ui.Widget {
	message_text := if message.text.len > 30 {
		'${message.text.substr(0, 30)}...'
	} else {
		message.text
	}

	return ui.row(
		heights: [64.0, 64.0, 64.0]
		widths: [54.0, 180.0, 32.0]
		children: [
			ui.column(
				children: [
					ui.picture(
						height: 48
						width: 48
						path: message.from.avatar_path
					),
				]
			),
			ui.column(
				margin: ui.Margin{
					top: 10.0
				}
				children: [
					ui.row(
						children: [
							ui.label(
								text: message.from.fullname
								text_color: gx.white
								text_size: 18.0
							),
						]
					),
					ui.row(
						children: [
							ui.label(
								text: message_text
								text_color: gx.gray
								text_size: 16.0
							),
						]
					),
				]
			),
			ui.column(
				margin: ui.Margin{
					top: 10.0
				}
				children: [
					ui.label(
						text: message.time.hhmm()
						text_color: gx.gray
						text_size: 14.0
					),
				]
			),
		]
	)
}
