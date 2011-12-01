When /^I wait for the ajax request to finish$/ do
  start_time = Time.now
  page.evaluate_script('jQuery.isReady&&jQuery.active==0').class.should_not eql(String) until page.evaluate_script('jQuery.isReady&&jQuery.active==0') or (start_time + 5.seconds) < Time.now do
    sleep 1
  end
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

#JS confirm dialog
When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept    
end

#JS confirm dialog
When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end



