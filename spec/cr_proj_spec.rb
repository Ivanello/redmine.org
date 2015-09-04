require_relative 'spec_helper'
require_relative '../pages/login_page'


describe "Creation project flow" do

  # shared_context "Fill reg form with" do |data|
  #   before :all do
  #     visit(RegPage).register_as(data)
  #   end
  # end

  describe "Negative cases" do
    context "when on ______ page" do
      context "fill new proj form with" do
        before :all do
          visit(NewProjectPage).create_proj(data)
        end
        it 
      end
    end
  end
  describe "Positive cases" do
    context "when on _____ page" do
      context "fill new proj form with" do
        before :all do
          visit(NewProjectPage).create_proj(data)
        end
        it 'new project created' do
          expect...
        end
        it 'it is on proj page' do
          expect...
        end
        it 'has correct url' do
          expect...
        end
      end
    end
  end
end