Given /^I am "([^\"]*)" and I follow "([^"]*)"(?: within "([^"]*)")?$/ do |username, link, selector|
  step 'Logged in as "'+username+'"'
  with_scope(selector) do
    click_link(link)
  end
end

