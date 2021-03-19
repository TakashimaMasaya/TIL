nubers = [10, 8, 3, 5, 2, 4, 11, 18, 20, 33]
newnubers = []
n = 0

while n <100
  n = n + 1
  nubers.each do |nuber|
    if n == nuber
      newnubers.push(n)
    end
  end
end

p newnubers