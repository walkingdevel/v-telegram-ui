module widgets

import ui
import gx

pub fn new_chat_item(user_avatar_path string, user_fullname string, last_message string, last_message_time string) &ui.Stack {
	message := if last_message.len > 30 {
		'${last_message.substr(0, 30)}...'
	} else {
		last_message
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
						path: user_avatar_path
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
								text: user_fullname
								text_color: gx.white
								text_size: 18.0
							),
						]
					),
					ui.row(
						children: [
							ui.label(
								text: message
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
						text: last_message_time
						text_color: gx.gray
						text_size: 14.0
					),
				]
			),
		]
	)
}
