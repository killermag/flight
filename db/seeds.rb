
provinces = [ { name: 'Alberta', code: 'AB' },
              { name: 'British Columbia', code: 'BC' },
              { name: 'Manitoba', code: 'MB' },
              { name: 'New Brunswick', code: 'NB' },
              { name: 'Newfoundland and Labrador', code: 'NL' },
              { name: 'Northwest Territories', code: 'NT' },
              { name: 'Nova Scotia', code: 'NS' },
              { name: 'Nunavut', code: 'NU' },
              { name: 'Ontario', code: 'ON' },
              { name: 'Prince Edward Island', code: 'PE' },
              { name: 'Quebec', code: 'QC' },
              { name: 'Saskatchewan', code: 'SK' },
              { name: 'Yukon Territory', code: 'YT' } ]

provinces.each do |p| 
  Airport.create name: p[:name], code: p[:code]
end 


#----------------------------------------------------------
def airports 
  max = Airport.count 
  from = Airport.find(rand(1..max))
  to = Airport.find(rand(1..max))
  while from == to 
    to = Airport.find(rand(1..max))
  end 
  return { from: from , to: to }
end 

def duration 
  return "#{rand(1..10)}h"
end 

def date 
  date = DateTime.now + rand(10)
  date.change( { hour: rand(24), min: rand(60) } )
end 

#----------------------------------------------------------

rand(5..10).times do 
  locales = airports 
  Fly.create from: locales[:from], to: locales[:to], duration: duration, departure_date: date 
end
