extends character

var dialogue: Dictionary = {
	"start": 'Oh, darling, you look absolutely dreadful. Are you lost, or just desperate?',
	"I need a way out of the country. You have connections.": "no"
}

var responses: Dictionary = {
	"start": ["I need a way out of the country. You have connections.", "Piss off", ":3"],
	"I need a way out of the country. You have connections.": ["kys"],
}
