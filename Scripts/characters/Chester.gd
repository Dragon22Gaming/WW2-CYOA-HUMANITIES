extends character

var dialogue: Dictionary[String, String] = {
	"start": 'You know, people like you make real good noises when they’re scared.',
	"I don’t want trouble.": "Oh, but I do. And you just walked right into it. (He pulls out a knife.)",
	"I have money. You can take it.": "(He laughs, twirling the blade.) I don’t want money. I want to see what colour you bleed.",
	"I know people. If I disappear, they’ll come looking.": "(His grin widens.) Then let’s make sure they never find you. (He lunges.)",
}

var responses: Dictionary = {
	"start": ["","I don’t want trouble."],
	"I don’t want trouble.": ["", "I have money. You can take it."],
	"I have money. You can take it.": ["", "I know people. If I disappear, they’ll come looking."],
	"I know people. If I disappear, they’ll come looking.": ["", "stabbed"],
	"": ["stabbed", "stabbed", "stabbed"]
}
