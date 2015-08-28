describe "Log in out flow" do

  describe "Negative login" do
    context "when login empty" do

    end
    context "when login does not registered" do

    end
    context "when pass empty" do

    end
    context "when pass wrong" do

    end
  end
  describe "Negative logout" do

  end

  describe "Positive login" do
    before() do

    end
    context "when login/pass submitted" do
      it "is logged in" do
        expect(on(MyAccountPage).logged_in?).to eql true
      end
      it "has right url" do
        expect(on(MyAccountPage).current_url).to include('/my/page')
      end
    end

  end

  describe "Positive logout" do
  end
end