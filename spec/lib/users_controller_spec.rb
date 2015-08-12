require 'rails_helper'
require 'factory_girl_rails'

# describe UsersController do
RSpec.describe UsersController, :type => :controller do

  describe 'POST #create' do
    it 'routes to the correct route' do
      expect(:get => "/users/show").to route_to(
      "controller"=>"users", "action"=>"show", "id"=>"show"
    )
    end
    xit "creates a @user with params" do
      user = build(:user)
      expect(assigns(:user)).to be_a_new(User)
      # expect(user).to be_valid
    end
    xit "created a user with a stringified description"
    xit "redirects to @user upon save"
    xit "redirects to users#new if user is not saved" do
      get :index
      expect(response).to redirect_to(:new)
    end
  end

  # shows user's cellar
  context "GET #show" do
    xit "assigns current user to @user" do
      user = build(:user)
      expect(assigns(:user)).to eq(user)
    end

    describe "knows correct attributes of a user" do
      let(:user) { create(:user) }

      it "builds a user that is an instance of a class User" do
        user = build(:user)
        expect(user.class).to eq(User)
      end

      it "assigns a user with a stringified location" do
        user.stringified_location = "#{user.city}#{user.state}#{user.country}"
        expect(user.stringified_location).not_to be_empty
      end

      it "renders the show template" do
        get :show, id: user.id
        expect(response).to render_template("users/show")
      end

      it "responds with an ok message" do 
        expect(response.status).to eq(200)
      end
    end
  end
end
