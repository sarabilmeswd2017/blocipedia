require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) {Wiki.create!(title:"New wiki title", body:"New wiki body", private:false)}

  describe "attributes" do
    it "should respond to title" do
      expect(wiki).to respond_to(:title)
    end
    it "should respond to body" do
      expect(wiki).to respond_to(:body)
    end
    it "should respond to resolved" do
      expect(wiki).to respond_to(:private)
    end
  end


  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(15) }
end
