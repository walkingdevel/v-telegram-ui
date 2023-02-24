module widgets

import gx
import ui

pub fn create_chat(messages []string) &ui.Stack {
	return ui.column(
		children: messages.map(fn (message string) ui.Widget {
			return ui.row(
				children: [
					ui.label(
						text: message
						text_color: gx.white
					),
				]
			)
		})
	)
}
