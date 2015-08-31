require_relative 'spec_helper'
require_relative '../pages/login_page'



describe "Log in out flow" do

  describe "Negative login" do
    context "when login empty" do
      before :each do
        visit(LoginPage).login_with('','lkjhlkjh')
      end
      it "has message login empty" do
        expect(on(LoginPage).warning?).to eql true
      end

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
  describe "Negative logout" do

  end

  describe "Positive login" do
    before() do

    end
    context "when login/pass submitted" do
      # it "is logged in" do
      #   expect(on(MyAccountPage).logged_in?).to eql true
      # end
      # it "has right url" do
      #   expect(on(MyAccountPage).current_url).to include('/my/page')
      # end
    end

  end

  describe "Positive logout" do
  end
end