
$coin_arr = [25, 10, 5, 1]

def change_maker_looping(amount)
    result = []
    coin_c = $coin_arr.dup
    until coin_c.empty?
      $coin_arr.each do |coin|
          if amount % coin == amount
              coin_c.shift
          else
              t = amount / coin
              t.times { result << coin_c.first }
              amount -= t * coin_c.first
              coin_c.shift
          end
      end
  end
  result
end

def change_maker_recursion(amount, result=[])
	return result if $coin_arr.empty? || amount == 0
	
	first_coin = $coin_arr.first
	if amount % first_coin == amount
		$coin_arr.delete_at(0)
	else
		t = amount / first_coin
		t.times { result << first_coin }
		amount = amount % first_coin
		$coin_arr.delete_at(0)
	end
	change_maker_recursion(amount, result)
	result
end

def change_maker(amount)
  puts "by looping: #{change_maker_looping(amount)}"
	puts "by recursion: #{change_maker_recursion(amount)}"
end

change_maker(27)



