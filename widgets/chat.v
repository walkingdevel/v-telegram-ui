module widgets

import ui
import messages { Message }
import users { User }
import widgets

pub fn new_chat(user &User, chat_messages []&Message) &ui.Stack {
	return ui.column(
		margin: ui.Margin{
			top: 10.0
			left: 10.0
			right: 10.0
		}
		heights: chat_messages.map(f64(50.0))
		scrollview: true
		spacing: 10.0
		children: chat_messages.map(fn [user] (message &Message) ui.Widget {
			widths := if user == message.from { [ui.stretch] } else { [100.0, ui.stretch] }

			return ui.row(
				widths: widths
				children: [
					if user == message.from {
						ui.Widget(ui.column())
					} else {
						widgets.new_message(message)
					},
					if user == message.from {
						widgets.new_message(message)
					} else {
						ui.Widget(ui.column())
					},
				]
			)
		})
	)
}
