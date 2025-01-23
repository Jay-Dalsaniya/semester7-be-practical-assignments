from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk

# Ensure you download the VADER lexicon (only once)
nltk.download('vader_lexicon')

# Initialize the SentimentIntensityAnalyzer
sia = SentimentIntensityAnalyzer()

# Tweets about AI
tweets = [
    "Artificial Intelligence is transforming the world in unimaginable ways!",
    "AI can help solve complex problems but it must be handled responsibly.",
    "I'm really excited to see how AI is being used in healthcare.",
    "AI in education is going to make learning more personalized and accessible.",
    "The future of AI is bright but we need to ensure it doesn't replace jobs.",
    "AI technology is advancing faster than we can keep up with."
]

# Function to analyze sentiment of each tweet
def analyze_sentiment(tweets):
    for tweet in tweets:
        print(f"Tweet: {tweet}")
        score = sia.polarity_scores(tweet)
        print(f"Sentiment Score: {score}")
        print("\n")

# Call the function to analyze sentiment
analyze_sentiment(tweets)
