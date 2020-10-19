require 'pry'

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_supplies, supply)
  holiday_supplies[:winter].each do |holiday, supplies|
    supplies << supply
  end
end

def add_supply_to_memorial_day(holiday_supplies, supply)
  holiday_supplies[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_supplies, season, holiday, supply)
  holiday_supplies[season][holiday] = supply
end

def all_winter_holiday_supplies(holiday_supplies)
  holiday_supplies[:winter].collect do |holiday, supplies|
    supplies
  end.flatten
end

def all_supplies_in_holidays(holiday_supplies)
  holiday_supplies.each do |season, holidays|
    puts season.to_s.capitalize! + ':'
    holidays.each do |holiday, supplies|
      new_holiday = holiday.to_s.split('_').each do |word|
        word.capitalize!
      end.join(' ')
    puts "  #{new_holiday}: #{supplies.join(', ')}"
    end
  end
end

def all_holidays_with_bbq(holiday_supplies)
  holiday_supplies.collect do |season, holidays|
    holidays.collect do |holiday, supplies|
      holiday if supplies.include?("BBQ")
    end
  end.flatten.compact
end
