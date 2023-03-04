module widgets

import ui
import gx
import time

const (
	message_bg_color = gx.Color{
		r: 50
		g: 50
		b: 50
		a: 255
	}
)

pub struct Message {
pub:
	from &User
	to   &User
	text string
	time time.Time
}

pub fn new_message(message &Message) ui.Widget {
	return ui.row(
		bg_color: widgets.message_bg_color
		bg_radius: 10.0
		margin: ui.Margin{
			top: 10.0
			left: 10.0
		}
		widths: [ui.stretch]
		heights: [ui.stretch]
		children: [
			ui.textbox(
				bg_color: widgets.message_bg_color
				is_multiline: true
				is_wordwrap: true
				borderless: true
				read_only: true
				text: &message.text
				text_color: gx.white
			),
		]
	)
}
