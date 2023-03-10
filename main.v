module main

import ui
import gx
import os
import widgets { Message, User }
import time

const (
	window_title  = 'Telegram'
	window_height = 500
	window_width  = 900
	dark_gray     = gx.Color{
		r: 30
		g: 30
		b: 30
		a: 255
	}
	light_gray = gx.Color{
		r: 50
		g: 50
		b: 50
		a: 255
	}
)

[heap]
struct App {
	window &ui.Window
}

fn main() {
	me := get_test_users().first()
	messages := get_test_messages()

	app := App{
		window: ui.window(
			title: window_title
			height: window_height
			width: window_width
			bg_color: dark_gray
			resizable: true
			children: [
				ui.row(
					heights: [ui.stretch, ui.stretch, ui.stretch]
					widths: [70.0, 300.0, ui.stretch]
					children: [
						ui.column(
							heights: [48.0, 48.0]
							margin: ui.Margin{
								top: 30.0
							}
							spacing: 5.0
							children: [
								widgets.new_folder(
									typ: .all
									name: 'All chats'
									icon_size: 44
								),
								widgets.new_folder(
									typ: .custom
									name: 'V lang'
									icon_size: 44
								),
							]
						),
						ui.column(
							heights: [
								50.0,
								ui.stretch,
								50.0,
							]
							children: [
								ui.row(
									bg_color: light_gray
									widths: [ui.stretch]
									children: [ui.textbox(
										placeholder: 'Search'
									)]
								),
								ui.column(
									scrollview: true
									bg_color: light_gray
									heights: messages.map(f64(70.0))
									children: messages.map(*widgets.new_chat_item(it))
								),
								ui.column(
									bg_color: light_gray
								),
							]
						),
						ui.column(
							widths: [
								ui.stretch,
							]
							children: [
								widgets.new_chat(me, get_test_chat()),
							]
						),
					]
				),
			]
		)
	}

	ui.run(app.window)
}

fn get_test_users() []&User {
	return [
		&User{
			username: 'walkingdevel'
			fullname: 'walking devel'
			avatar_path: os.join_path('assets', 'v.png')
		},
		&User{
			username: 'vlang'
			fullname: 'vlang'
			avatar_path: os.join_path('assets', 'v.png')
		},
		&User{
			username: 'v-rss-reader'
			fullname: 'V RSS Reader'
			avatar_path: os.join_path('assets', 'v.png')
		},
	]
}

fn get_test_messages() []&Message {
	users := get_test_users()
	me := users[0]
	vlang := users[1]
	v_rss_reader := users[2]

	return [
		&Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		&Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		&Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		&Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		&Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		&Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		&Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		&Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		&Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
		&Message{
			from: me
			to: me
			text: 'https://github.com/walkingdevel'
			time: time.now()
		},
		&Message{
			from: vlang
			to: me
			text: 'https://github.com/vlang'
			time: time.now()
		},
		&Message{
			from: v_rss_reader
			to: me
			text: 'https://github.com/walkingdevel/v-rss-reader'
			time: time.now()
		},
	]
}

fn get_test_chat() []&Message {
	users := get_test_users()
	me := users[0]
	vlang := users[1]

	return [&Message{
		from: me
		to: vlang
		text: 'Hello'
		time: time.now()
	}, &Message{
		from: vlang
		to: me
		text: ':)'
		time: time.now()
	},
		&Message{
			from: me
			to: vlang
			text: 'How are you?'
			time: time.now()
		}]
}
