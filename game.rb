@win = 0
@lose = 0

p "何本勝負？(press 1 or 3 or 5)"
x = gets.to_i
p "#{x}本勝負を選びました"

def result_g
  cpu_hand = ["グー","チョキ","パー"].sample
  p "CPU…#{cpu_hand}"
  if cpu_hand == "パー"
    p "負けです"
    @lose += 1
  elsif cpu_hand == "チョキ"
    p "勝ちです"
    @win += 1
  else
    p "あいこです"
    p "じゃんけん…(press g or c or p)"
    y = gets
    game(y)
  end
end
def result_c
  cpu_hand = ["グー","チョキ","パー"].sample
  p "CPU…#{cpu_hand}"
  if cpu_hand == "パー"
    p "勝ちです"
    @win += 1
  elsif cpu_hand == "チョキ"
    p "あいこです"
    p "じゃんけん…(press g or c or p)"
    y = gets
    game(y)
  else
    p "負けです"
    @lose += 1
  end
  
end
def result_p
  cpu_hand = ["グー","チョキ","パー"].sample
   p "CPU…#{cpu_hand}"
  if cpu_hand == "パー"
    p "あいこです"
    p "じゃんけん…(press g or c or p)"
    y = gets
    game(y)
  elsif cpu_hand == "チョキ"
    p "負けです"
    @lose += 1
  else
    p "勝ちです"
    @win += 1
  end
end

def game(y)
  if y == "g\n" 
    player_hand = "ぐー"
    p "あなた…#{player_hand}"
    result_g
  elsif y == "c\n" 
    player_hand = "チョキ"
    p "あなた…#{player_hand}"
    result_c
  elsif y == "p\n" 
    player_hand = "パー"
    p "あなた…#{player_hand}"
    result_p
  else
    p "gかcかpを押してください"
    return
  end
end

x.times do
  p "じゃんけん…(press g or c or p)"
  y = gets
  game(y)
  p "#{@win}勝#{@lose}敗"
end

p "結果"

if @win > @lose
  p "#{@win}勝#{@lose}敗であなたの勝ち"
else
  p "#{@win}勝#{@lose}敗であなたの負け"
end

