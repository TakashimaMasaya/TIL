# require "awesome_print"

# ap ["カフェラテ","モカ","コーヒー"]


# require "net/http"
# require "uri"
# uri = URI.parse("https://igarashikuniaki.net/example.json")
# p Net::HTTP.get(uri)

# require "sinatra"
# get "/omikuji" do
#   p ["大吉","中吉","末吉","凶"].sample
# end

require "net/http"
require "uri"
uri = URI.parse("sinatra_hi.rb")
p Net::HTTP.get(uri)

