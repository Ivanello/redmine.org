require_relative 'spec_helper'
require_relative '../pages/reg_page'
require_relative '../pages/my_account_page'

# require_relative ''


include DataMagic
describe "Reg Flow" do

  shared_context "Fill reg form with" do |data|
    before :all do
      visit(RegPage).register_as(data)
    end
  end

  shared_examples "Has error message" do |warning_mes|
    it "has warning mess:#{warning_mes}" do
      expect(on(RegPage).messages).to include warning_mes
    end
  end

  shared_examples "For negative reg" do |data,message|
    context "when #{data.keys.join(' and ')} submitted with '#{data.values.join(' and ')}' " do
      include_context "Fill reg form with", data
      include_examples "Has error message", message
    end
  end

  describe "Positive Reg" do
    context "on Reg page" do
      context "when reg form submitted" do
        include_context "Fill reg form with" ,{}

        it "is logged in" do
          expect(on(MyAccountPage).logged_in?).to eql true
        end
        it "has message 'Your account was successfully created'" do
          expect(on(MyAccountPage).flash_notice_element.when_visible.text).to include('Your account')
        end
        it "has right url" do
          expect(on(MyAccountPage).current_url).to include('/my/account')
        end
      end
    end
  end
  describe "Negativ Reg flow" do
    context "On reg page" do
      data_for(:data).each do |array|
        key = array[0]
        include_examples 'For negative reg', array[1], data_for(:messages)[key]
      end

      # describe "login field warnings" do



        # include_examples "For negative reg", data_for
        # context "when login field has wrong chars" do
          # include_context "Fill reg form with" , {login:'(*&^%$'}
          # it "has message Login is invalid"
          # include_examples "Has error message", 'Login is invalid'

        # context "when login field empty" do
        #   include_context "Fill reg form with" , {login:''}
        #   # it "has mess Login cannot be blank"
        #   include_examples "Has error message", 'Login cannot be blank'
        # end
        # context "when login field too long" do
        #   include_context "Fill reg form with" , {login:'1111111111111111111111111111111111111111111111111111111111111'}
        #   # it "has mess Login is too long (60 chars)"
        #   include_examples "Has error message", 'Login is too long (maximum is 60 characters)'
        # end
        # context "when login existing" do
        #   include_context "Fill reg form with" , {login:'test'}
        #   # it "has mess Login has already been taken "
        #   include_examples "Has error message", 'Login has already been taken'
        # end
      # end

      # describe "pass field warnings" do
      #   context "when passwords did not match " do
      #     include_context "Fill reg form with" , {pass:'1234', pass_conf:'12345'}
      #     # it "has mess:'Password doesn't match confirmation'"
      #     include_examples "Has error message", 'Password doesn\'t match confirmation'
      #   end
      #   context "when pass empty" do
      #     include_context "Fill reg form with" , {pass:'', pass_conf:''}
      #     # it "has mess:'Password is too short (minimum is 4 characters)'"
      #     include_examples "Has error message", 'Password is too short (minimum is 4 characters)'
      #   end
      #   context "when pass less then4 char" do
      #     include_context "Fill reg form with" , {pass:'123',pass_conf:'123'}
      #     # it "has mess:'Password is too short (minimum is 4 characters)'"
      #     include_examples "Has error message", 'Password is too short (minimum is 4 characters)'
      # 
      #   end
      # end

      # describe "name field warnings" do
      #   context "when name field longer then 30 char" do
      #     include_context "Fill reg form with" , {firstname:'1111111111111111111111111111111111111111111111111111111111111111111111111111111'}
      #     # it "has mess:'First name is too long (maximum is 30 characters)'"
      #     include_examples "Has error message", 'First name is too long (maximum is 30 characters)'
      #   end
      #   context "when name field empty" do
      #     include_context "Fill reg form with" , {firstname:''}
      #     # it "has mess:'First name is too long (maximum is 30 characters)'"
      #     include_examples "Has error message", 'First name cannot be blank'
      #   end
      # end

      # describe "last name field warnings" do
      #   context "when last name field longer then 30 char" do
      #     include_context "Fill reg form with" , {lastname:'1111111111111111111111111111111111111111111111111111111111111111111111111111111'}
      #     # it "has mess:'Last name is too long (maximum is 30 characters)'"
      #     include_examples "Has error message", 'Last name is too long (maximum is 30 characters)'
      #   end
      #   context "when last name field empty" do
      #     include_context "Fill reg form with" , {firstname:''}
      #     # it "has mess:'Last name is too long (maximum is 30 characters)'"
      #     include_examples "Has error message", 'Last name cannot be blank'
      #   end
      # end

      # describe "email feld warnings" do
      #   context "when email field is empty" do
      #     include_context "Fill reg form with" , {email:''}
      #     # it "has mess:'Email cannot be blank'"
      #     include_examples "Has error message", 'Email cannot be blank'
      #   end
      #   context "when email field with invalid email address" do
      #     include_context "Fill reg form with" , {email:'email'}
      #     # it "has mess: 'Email is invalid'"
      #     include_examples "Has error message", 'Email is invalid'
      #   end
      # end
    end
  end
end