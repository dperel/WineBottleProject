require 'rails_helper'
require 'factory_girl_rails'

# describe UsersController do
RSpec.describe UsersController, :type => :controller do

  # creates a new user upon signup
  context 'POST #create' do
    describe "creates user with correct properties" do
      let(:user) { create(:user) }
      it "creates a user that is an instance of a class User" do
        expect(user.class).to eq(User)
      end
      it "creates a user with a stringified location" do
        user.stringified_location = "#{user.city}#{user.state}#{user.country}"
        expect(user.stringified_location).not_to be_empty
      end
    end # ends describe creates user
    xit 'routes to the correct route' do
      expect(:get => "/users/show").to route_to(
      "controller"=>"users", "action"=>"show", "id"=>"show"
      )
    end
    xit "redirects to @user upon save" do
      user = build(:user)
      user.save
      expect(response.status).to eq(200)
    end
    xit "redirects to users#new if user is not saved" do
      user = build(:user, name: nil)
      user.save
      expect(response).to redirect_to '/users/new' if !user.save
    end
  end # end POST#create context

  # shows user's cellar
  context "GET #show" do
    xit "assigns current user to @user" do
      user = build(:user)
      expect(assigns(:user)).to eq(user)
    end
    describe "knows correct attributes of a user" do
      let(:user) { create(:user) }
      it "shows a user that is an instance of a class User" do
        user = build(:user)
        expect(user.class).to eq(User)
      end
      it "renders the show template" do
        get :show, id: user.id
        expect(response).to render_template("users/show")
      end
      it "responds with an ok message" do 
        expect(response.status).to eq(200)
      end
    end # end describe
  end # end get#SHOW context
end #end test
