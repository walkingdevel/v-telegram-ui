module main

import ui
import gx
import os

const (
	window_title     = 'Telegram'
	window_height    = 500
	window_width     = 800
	background_color = gx.Color{
		r: 25
		g: 35
		b: 44
		a: 0
	}
)

[heap]
struct App {
	window &ui.Window
}

fn create_chats_item() &ui.Stack {
	return ui.row(
		heights: [64.0, 64.0, 64.0]
		widths: [54.0, 180.0, 32.0]
		children: [
			ui.column(
				children: [
					ui.picture(
						height: 48
						width: 48
						path: os.join_path('assets', 'v.png')
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
								text: 'Saved messages'
								text_color: gx.white
								text_size: 18.0
							),
						]
					),
					ui.row(
						children: [
							ui.label(
								text: 'https://github.com/walkingdevel'
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
						text: '20:00'
						text_color: gx.gray
						text_size: 14.0
					),
				]
			),
		]
	)
}

fn create_chat(messages []string) &ui.Stack {
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

fn main() {
	app := App{
		window: ui.window(
			title: window_title
			height: window_height
			width: window_width
			bg_color: background_color
			children: [
				ui.row(
					children: [
						ui.column(
							heights: [70.0, 70.0, 70.0]
							children: [create_chats_item(), create_chats_item(),
								create_chats_item()]
						),
						create_chat(['hi', 'there']),
					]
				),
			]
		)
	}

	ui.run(app.window)
}
