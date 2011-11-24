When /^I have "(\d+)" projects in the system$/ do |number|
  (1..number.to_i).each do |i|
    Factory.create(:project, :name => "Company name "+i.to_s)
  end
end 


