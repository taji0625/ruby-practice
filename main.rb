plans = [
  {name: "沖縄旅行", price: 10000},
  {name: "北海道旅行", price: 20000},
  {name: "九州旅行", price: 15000}
]

DISCOUNT_RATE = 0.1

puts "旅行プランを選択してください。"
plans.each.with_index(1) do |plan, i|
  puts "#{i}. #{plan[:name]}(#{plan[:price]}円)"
end

while true
  print "プランの番号を選択 >"
  select_plan_num = gets.to_i
  break if (1..3).include?(select_plan_num)
  puts "1~3の番号を入力してください。"
end

chosen_plan = plans[select_plan_num - 1]

puts <<~TEXT
  #{chosen_plan[:name]}ですね。
  何名で予約されますか？
TEXT

while true
  print "人数を入力 >"
  number_of_people = gets.to_i
  break if number_of_people > 0
  puts "1人以上の人数を入力してください。"
end

puts "#{number_of_people}名ですね。"
total_price = number_of_people * chosen_plan[:price]
discount = total_price * DISCOUNT_RATE

if number_of_people >= 5
  puts <<~TEXT
    5名以上ですので#{(DISCOUNT_RATE * 100).floor}%割引となります。
    合計料金は#{total_price - discount.floor}円になります。
  TEXT
else
  puts "合計料金は#{total_price.floor}円になります。"
end