# Write your code here.
def dictionary                                      #contains all the words-to-be-substituted and their substitutes
  dictionary = {
    "hello" => 'hi',                                #'hello' is key and 'hi' is the key's value
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "for" => '4',
    "four" => '4',
    'be' => 'b',
    'you' => 'u',
    "at" => "@",
    "and" => "&"
  }
end

#replaces long words with their expected short form
def word_substituter(tweet)                                     #string of tweets
  tweet_array = tweet.split.collect do |word|                   #splits every tweet by going through every (collect) word(key)
    if dictionary.keys.include?(word.downcase)                  #checks if the keys from the hash dictionary includes lower case words; make every word downcase
        word = dictionary[word.downcase]                        #if yes, replace the actual key (word) with the converted values
    else
      word                                                      #else, return the word (key)
    end
  end
  tweet_array.join(" ")                                         #join the tweets that i split erlier to collect each word
end
#.keys -- Returns a new array populated with only the **keys** from this hash

#shortens each tweet and prints the results
def bulk_tweet_shortener(tweets)
  tweets.map do |tweet|                                         #itterates over the tweets
    puts word_substituter(tweet)                                #puts the result
  end
end
#Map-like Manipulation of Hash Values, it TRANSFORM data. Map returns a new array with the results.It won’t change the original.
#Map helps transform an array, hash, or range into a new array going over every element & appling some logic to it.
#https://www.rubyguides.com/2018/10/ruby-map-method/

def selective_tweet_shortener(tweet)
  if tweet.length > 140                                         #if the length of the tweet is more than 140 characters
    word_substituter(tweet)                                     #return the subtituted tweet
  else
    tweet                                                       # else return the original tweet
  end
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140                       #
    word_substituter(tweet)[0..136] + ("...")                     #cuts off (truncates) tweet to 140 characters with an ellipsis (...)
  else
    word_substituter(tweet)
  end

end
