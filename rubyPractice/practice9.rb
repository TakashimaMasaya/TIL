# module ChocolateChip
#   def chocolate_chip
#     @name += "チョコレートチップ"
#   end
# end

# class Drink
#   include ChocolateChip
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end

# drink = Drink.new("モカ")
# drink.chocolate_chip
# p drink.name

# module Espressoshot
#   Price = 100
# end

# p Espressoshot::Price

# module WhippedCream
#   def self.info
#     "トッピング用ホイップクリーム"
#   end
# end
# p WhippedCream.info

require_relative("practice9-2.rb")
p WhippedCream.info