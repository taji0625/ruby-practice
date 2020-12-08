require "./methods.rb"

plans = [
  {name: "沖縄旅行", price: 10000},
  {name: "北海道旅行", price: 20000},
  {name: "九州旅行", price: 15000}
]

DISCOUNT_RATE = 0.9

disp_plans(plans)
chosen_plan = choose_plan(plans)
quantity_of_people = determine_number_of_people(chosen_plan)
payment(quantity_of_people, chosen_plan)