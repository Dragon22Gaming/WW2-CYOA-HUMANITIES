extends character

var dialogue: Dictionary = {
	"start": 'Oh, darling, you look absolutely dreadful. Are you lost, or just desperate?',
	"I need a way out of the country. You have connections.": "Mmm, I do. But you see, so does the FBI, and they pay for little secrets like you. (She casually picks up the phone.)",
	"If you turn me in, you’ll regret it.": "Oh, I love a good threat! Sadly, I’ll be too busy counting my money to care. (She gestures to the door—there’s a knock.)",
	"I can pay. Whatever you want.": "Oh, sweetheart, I already am getting paid. (The sound of approaching footsteps.)"
}

var responses = {
	"start": ["I need a way out of the country. You have connections."],
	"I need a way out of the country. You have connections.": ["If you turn me in, you’ll regret it."],
	"If you turn me in, you’ll regret it.": ["I can pay. Whatever you want."],
	"I can pay. Whatever you want.": ["arrested"]
}
