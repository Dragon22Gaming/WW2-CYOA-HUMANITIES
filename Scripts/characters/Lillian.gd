extends character

var dialogue = {
	"start": "If you’re here to hurt me, just get it over with. I don’t care anymore.",
	"I need to get out of the country. Please.": "(She hesitates, studying you.) ...You’re in trouble, aren’t you?",
	"Yes. And if I stay, I’ll die.": "...There’s a boat down by the docks. Fisherman named Reyes. He’s not kind, but he won’t ask questions.",
	"I have a family waiting for me.": "(Her face hardens, but there’s pain in her eyes.) ...So did I. (She sighs.) Alright. I know someone who can hide you, but you owe me. Understand?",
	"Please. You’re my only hope.": "(She shakes her head, muttering.) Damn it. Fine. But you better not get caught, or I’ll regret this.",
	"escape": "escape"
}

var responses = {
	"start": ["I need to get out of the country. Please.", "I have a family waiting for me.", "Please. You’re my only hope."],
	"I need to get out of the country. Please.": ["Yes. And if I stay, I’ll die."],
	"Yes. And if I stay, I’ll die.": ["escape", "escape", "escape"],
	"I have a family waiting for me.": ["escape", "escape", "escape"],
	"Please. You’re my only hope.": ["escape", "escape", "escape"],
	"escape": ["escaped"]
}
