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
      # get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
    it "builds a user that is an instance of a class User" do
      user = build(:user)
      expect(user.class).to eq(User)
    end
    it "assigns a user with a stringified location" do
      user = build(:user)
      user.stringified_location = "#{user.city}#{user.state}#{user.country}"
      expect(user.stringified_location).not_to be_empty
    end
    it "shows all current bottles of a user" do
      expect(response).to eq (User.current_user.current_bottles)
    end
    xit "shows all former bottles of a user"
    xit "renders the show template" do
      # let(:user) { build(:user) }
      # get :show, id: user
      expect(response).to render_template("show")
    end
    it "responds with an ok message" do 
      expect(response.status).to eq(200)
    end
  end

end
