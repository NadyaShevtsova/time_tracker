Factory.define :user do |t|
	t.email Faker::Internet.email
        t.address "55 Southwest 17th Road, Miami"
	t.username Faker::Internet.user_name
	t.password "user"
        t.password_confirmation "user"
end

Factory.define :admin, :class => User do |t|
	t.email Faker::Internet.email
        t.address Faker::Address.city()+" "+Faker::Address.street_address
	t.username "admin"
	t.password "admin"
        t.password_confirmation "admin"
        t.admin true
end

Factory.define :project do |t|
	t.name Faker::Company.name
end

Factory.define :task do |t|
	t.association :user
	t.association :project
	t.description Faker::Lorem.sentence
        t.task_name Faker::Company.name
	t.external_link Faker::Internet.domain_name
	t.start_time "#{(Date.today).strftime("%Y/%m/%d 11:00")}"
        t.end_time "#{(Date.today).strftime("%Y/%m/%d 14:55")}"
end

