module main

import ui
import gx
import os
import widgets

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
			resizable: true
			children: [
				ui.row(
					heights: [ui.stretch]
					widths: [280.0]
					children: [
						ui.column(
							scrollview: true
							heights: [70.0, 70.0, 70.0, 70.0, 70.0, 70.0, 70.0, 70.0, 70.0, 70.0,
								70.0]
							children: [
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'Saved messages', 'https://github.com/walkingdevel',
									'20:00'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'vlang', 'https://github.com/vlang', '18:21'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'v-rss-reader', 'https://github.com/walkingdevel/v-rss-reader',
									'13:23'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'vlang', 'https://github.com/vlang', '18:21'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'v-rss-reader', 'https://github.com/walkingdevel/v-rss-reader',
									'13:23'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'vlang', 'https://github.com/vlang', '18:21'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'v-rss-reader', 'https://github.com/walkingdevel/v-rss-reader',
									'13:23'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'vlang', 'https://github.com/vlang', '18:21'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'v-rss-reader', 'https://github.com/walkingdevel/v-rss-reader',
									'13:23'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'vlang', 'https://github.com/vlang', '18:21'),
								widgets.new_chat_item(os.join_path('assets', 'v.png'),
									'v-rss-reader', 'https://github.com/walkingdevel/v-rss-reader',
									'13:23'),
							]
						),
						create_chat([
							'hi',
							'there',
						]),
					]
				),
			]
		)
	}

	ui.run(app.window)
}
