Given "I have 11 projects in the system" do 
  (1..11).each do |i|
    Factory.create(:project, :name => "Company name "+i.to_s)
  end
end 


