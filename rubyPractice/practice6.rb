# menu = {coffee: 300, caffe_latte: 400}
# p menu[:caffe_latte]
# menu = {"モカ" => "チョコレートシロップとミルク入り","カフェラテ"=>"ミルク入り"}
# p menu["モカ"]
#  menu.delete(:coffee)
#  p menu

#  if menu[:tea] == nil then
#   p "紅茶はありませんか？"
#  end

#  if menu[:caffe_latte] <= 500 then
#   p "カフェラテをください"
#  end

menu = {"コーヒー": 300, "カフェラテ": 400}
drinks = []

# menu.each do |key, value|
#   if value <=350 then
#     p "#{key}-#{value}"
#   end
# end

menu.each_key do |key|
  drinks.unshift("#{key}")
end

 p drinks


