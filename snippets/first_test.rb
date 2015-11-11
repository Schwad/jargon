def retrospective(object_thing, price_one, price_two, starting_time)
  begin
      look_back = 20
      price_one = price_one.gsub(/[,]/, "").to_f
      price_two = price_two.gsub(/[,]/, "").to_f

    while look_back > 0
      random = (-10..10).to_a.sample
      change_bottom = (90..110).to_a.sample / 100.0
      change_top = (90..110).to_a.sample / 100.0
      days_ago = look_back * 86400
      back_then = starting_time - days_ago

      object_thing.prices[back_then.to_i] = {"min_price"=> (price_one * change_bottom).round(2).to_s, "max_price"=> (price_two * change_top).round(2).to_s}
      look_back -= 1
      object_thing.save
    end
  rescue => e
    binding.pry
  end
end