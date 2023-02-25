module main

import ui
import gx
import os
import widgets
import time
import users { User }
import messages { Message }

const (
	window_title     = 'Telegram'
	window_height    = 500
	window_width     = 800
	background_color = gx.Color{
		r: 30
		g: 30
		b: 30
		a: 255
	}
)

[heap]
struct App {
	window &ui.Window
}

fn main() {
	me := &User{
		username: 'walkingdevel'
		fullname: 'walking devel'
		avatar_path: os.join_path('assets', 'v.png')
	}
	vlang := &User{
		username: 'vlang'
		fullname: 'vlang'
		avatar_path: os.join_path('assets', 'v.png')
	}
	v_rss_reader := &User{
		username: 'v-rss-reader'
		fullname: 'V RSS Reader'
		avatar_path: os.join_path('assets', 'v.png')
	}
	user_messages := [
		Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
	]

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
							heights: user_messages.map(f64(70.0))
							children: user_messages.map(*widgets.new_chat_item(it))
						),
						ui.column(
							children: [
								widgets.new_chat([
									'hi',
									':)',
									'bye',
								]),
							]
						),
					]
				),
			]
		)
	}

	ui.run(app.window)
}
