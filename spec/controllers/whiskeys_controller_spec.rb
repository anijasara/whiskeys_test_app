require 'rails_helper'

RSpec.describe WhiskeysController, type: :controller do

  let(:whiskey) {
    FactoryBot.create(:whiskey, title: "Ardberg", taste: "A", color: "B", smokiness: "C")
  }

  describe "GET #index" do
    it "assigns @whiskeys" do
      FactoryBot.create(:whiskey, title: "Ardberg", taste: "A", color: "B", smokiness: "C")
      get :index
      expect(JSON.parse(response.body).first['title']).to eq("Ardberg")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new whiskey" do
        expect{
          post :create, params: { whiskey: FactoryBot.attributes_for(:whiskey) }
        }.to change(Whiskey,:count).by(1)
      end
    end
  end

  describe "GET #search" do
    it "searches @whiskeys" do
      FactoryBot.create(:whiskey, title: "Jack Daniel", taste: "A", color: "B", smokiness: "C")
      get :search, params: {term: "color"}
      expect(JSON.parse(response.body).first['title']).to eq("Jack Daniel")
    end
  end
end