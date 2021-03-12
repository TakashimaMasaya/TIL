# def order
#   p "カフェラテをください"
# end

# order


# def area
#   p 3*3
# end

# area

# def dice
#   number =  [1,2,3,4,5,6].sample
#   p number
#   if number == 1 then
#     p "もう一回"
#     dice
#   end
# end

# dice

# def order(drink)
#   p "#{drink}ください"
# end
# order("カフェラテ")


# def price(item:,size:"ショート")
#   case "#{item}"
#   when "コーヒー" then
#     price = 300
#   when "カフェラテ" then
#     price = 400
#   end

#   case "#{size}"
#   when "ショート" then
#     p price 
#   when "トール" then
#     p price + 50
#   when "ベンティ" then
#     p price + 100
#   end
# end

# price(item: "コーヒー",size: "トール")

def order(drink)
  p "#{drink}ください"
end

order("コーヒー")