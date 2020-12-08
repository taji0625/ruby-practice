def disp_plans(plans)
  puts "旅行プランを選択してください。"
  plans.each.with_index(1) do |plan, i|
    puts "#{i}. #{plan[:name]}(#{plan[:price]}円)"
  end
end

def choose_plan(plans)
  while true
    print "プランの番号を選択 >"
    select_plan_num = gets.to_i
    break if (1..3).include?(select_plan_num)
    puts "1~3の番号を入力してください。"
  end
  plans[select_plan_num - 1]
end

def determine_number_of_people(chosen_plan)
  puts <<~TEXT
    #{chosen_plan[:name]}ですね。
    何名で予約されますか？
  TEXT
  while true
    print "人数を入力 >"
    quantity_of_people = gets.to_i
    break if quantity_of_people > 0
    puts "1人以上の人数を入力してください。"
  end
  quantity_of_people
end

def payment(quantity_of_people, chosen_plan)
  puts "#{quantity_of_people}名ですね。"
  total_price = quantity_of_people * chosen_plan[:price]
  if quantity_of_people >= 5
    puts <<~TEXT
      5名以上ですので10%割引となります。
      合計料金は#{(total_price * DISCOUNT_RATE).floor}円になります。
    TEXT
  else
    puts "合計料金は#{total_price.floor}円になります。"
  end
end