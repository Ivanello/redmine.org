require_relative 'spec_helper'
require_relative '../pages/login_page'



describe "Login Logout flow" do

  shared_context "Fill login/pass form with" do |login,pass|
    before :all do
      visit(LoginPage).login_with(login,pass)
    end
  end

  shared_examples "Has error message" do |warning_mes|
    it "has warning mess:#{warning_mes}" do
      expect(on(LoginPage).warning?).to eql true
    end
  end

  describe "Negative login" do
    context "when login empty" do
      include_context "Fill login/pass form with" ,'','1234'
      include_examples "Has error message"
    end
    context "when login does not registered" do
      before :all do
        visit(LoginPage).login_with(';lkj;lkj',';lkj')
      end
      it "has message login empty" do
        expect(on(LoginPage).warning?).to eql true
      end
    end
    context "when pass empty" do
      before :all do
        visit(LoginPage).login_with('ivan','')
      end
      it "has message login empty" do
        expect(on(LoginPage).warning?).to eql true
      end
    end
    context "when pass wrong" do
      before :all do
        visit(LoginPage).login_with('ivan','12345')
      end
      it "has message login empty" do
        expect(on(LoginPage).warning?).to eql true
      end
    end
  end
  describe "Positive login" do
    context "when login/pass submitted" do
      include_context "Fill login/pass form with" ,'ivan','1234'
      it "is logged in" do
        expect(on(@current_page).logged_in?).to eql true
      end
      it "has right url" do
        expect(@current_page.current_url).to include('/my/page/')
      end
    end
  end
  describe "Positive logout" do

  end
end