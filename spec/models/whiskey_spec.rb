require 'rails_helper'

RSpec.describe Whiskey, type: :model do
  let(:Whiskey) {
    FactoryBot.create(:whiskey)
  }


  describe '#validations' do
    it "should validates uniqueness of title" do
      should validate_uniqueness_of(:title)
    end

    it "should validates presence of title" do
      should validate_presence_of(:title)
    end

    it "should validates presence of taste" do
      should validate_presence_of(:taste)
    end

    it "should validates presence of color" do
      should validate_presence_of(:color)
    end
  end

  describe '#class_methods' do
    it "should get the whiskeys sorted based on the param taste" do
      w1 = FactoryBot.create(:whiskey, title: "Ardberg", taste: "A", color: "B", smokiness: "C")
      w2 = FactoryBot.create(:whiskey, title: "Jack Daniel", taste: "B", color: "A", smokiness: "C")
      res = Whiskey.get_whiskeys_param_ordered("taste")
      expect(res.first.title).to eq("Ardberg")
    end

    it "should get the whiskeys sorted based on the param color" do
      w1 = FactoryBot.create(:whiskey, title: "Ardberg", taste: "A", color: "B", smokiness: "C")
      w2 = FactoryBot.create(:whiskey, title: "Jack Daniel", taste: "B", color: "A", smokiness: "C")
      res = Whiskey.get_whiskeys_param_ordered("color")
      expect(res.first.title).to eq("Jack Daniel")
    end

    it "should get the whiskeys sorted based on the param smokiness" do
      w1 = FactoryBot.create(:whiskey, title: "Glenlivet", taste: "A", color: "B", smokiness: "A")
      res = Whiskey.get_whiskeys_param_ordered("smokiness")
      expect(res.first.title).to eq("Glenlivet")
    end
  end
end
