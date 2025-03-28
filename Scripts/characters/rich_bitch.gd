extends character

var dialogue: Dictionary = {
	"start": 'hello i am the rich bitch >:D',
	"Hello!": "ok",
	"Piss off": 'You are very rude, KYS :3',
	"U too <3": "Ok *dies*",
	"Game over lol": "DEATH"
}

var responses: Dictionary = {
	"start": ["Hello!", "Piss off", ":3"],
	"Piss off": ["No LOL", "U too <3", ":("],
	"U too <3": ["Game over lol"],
	"Game over lol": ["YOU ARE DEAD"]
}
