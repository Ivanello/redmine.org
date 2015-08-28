require 'rspec'
require 'page-object'
require 'data_magic'
# require_relative 'rspec'

RSpec.configure do |config|
  config.include PageObject::PageFactory


  config.before :all do
    @browser = Watir::Browser.new :firefox
  end

  config.after :all do
    # @browser.close
  end
end

