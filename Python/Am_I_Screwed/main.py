import random
import pyperclip
import keyboard
from textblob import TextBlob
from plyer import notification

responses = {
    "chill": ["You're totally fine.", "Stop overthinking.", "Chill dood"],
    "ok-ish": ["Meh, could be worse.", "You're in a bit of trouble, but you'll survive."],
    "screwed": ["U almost ded myn", "Bruh, start praying."],
    "doomed": ["RIP. It was nice knowing you.", "You're beyond saving. Run."]
}


def textChecheker():
    text = pyperclip.paste().strip()

    # Check if clipboard is empty
    if not text:
        notification.notify(title="Error", message="Clipboard is empty! Copy some text first.", timeout=3)
        return

    sentiment = TextBlob(text).sentiment.polarity
    print(f"Analyzing text: {text}")  # Debugging output
    print(f"Sentiment Score: {sentiment}")  # Debugging output

    if sentiment > 0.3:
        category = "chill"
    elif sentiment > -0.1 and sentiment < 0.3:
        category = "ok-ish"
    elif sentiment > -0.5 and sentiment < 0.1:
        category = "screwed"
    else:
        category = "doomed"

    response = random.choice(responses[category])

    notification.notify(title=f"Sentiment: {category.upper()}", message=response, timeout=4)


keyboard.add_hotkey("ctrl+shift+s", textChecheker)

print("Press Ctrl+Shift+S to analyze selected text.")
keyboard.wait("esc")
