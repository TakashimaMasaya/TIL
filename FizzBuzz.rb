# 1～任意の数までの数字を順番に表示する
# ただし、3の倍数のときはFizz、5の倍数のときはBuzz、3と5の公倍数のときはFizzBuzzと表示する。
# 任意の数はプログラム実行時に引数で渡せるようにする


def fizzbuzz(x)
  n = 0
  while n < x
    n = n + 1
    if n % 3 == 0 && n % 5 == 0 then
      p "FizzBuzz"
    elsif n % 3 == 0 then
      p "Fizz"
    elsif n % 5 == 0 then
      p "Buzz"
    else
      p n
    end  
  end
end
p fizzbuzz(ARGV[0].to_i)

