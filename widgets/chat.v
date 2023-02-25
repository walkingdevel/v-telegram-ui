module widgets

import gx
import ui

pub fn new_chat(messages []string) &ui.Stack {
	return ui.column(
		margin: ui.Margin{
			top: 10.0
			left: 10.0
		}
		heights: messages.map(f64(50.0))
		scrollview: true
		spacing: 10.0
		children: messages.map(fn (message string) ui.Widget {
			return ui.row(
				bg_color: gx.Color{
					r: 50
					g: 50
					b: 50
					a: 255
				}
				bg_radius: 10.0
				margin: ui.Margin{
					top: 10.0
					left: 10.0
				}
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
