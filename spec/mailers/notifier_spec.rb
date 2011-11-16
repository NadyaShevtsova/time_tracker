require 'spec_helper'
 
describe "Signup Email" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
    # include ActionController::UrlWriter - old rails
    include Rails.application.routes.url_helpers

    before(:all) do
      @user = Factory.create(:user)
      @email = Notifier.welcome(@user, "1o12ks")
    end

    it "should be set to be deliveredrequire File.dirname(__FILE__) + '/../spec_helper'
 to the email passed in" do
      @email.should deliver_to(@user.email)
    end

    it "should contain the user's message in the mail body" do
      @email.should have_body_text(/1o12ks/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/Welcome Message/)
    end

end
