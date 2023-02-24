module messages

import time
import users { User }

pub struct Message {
pub:
	from &User
	to   &User
	text string
	time time.Time
}
