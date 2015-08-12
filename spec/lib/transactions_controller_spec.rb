require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe UsersController, :type => :controller do
  context 'when user is logged in' do
      # with :user

      before do
        sign_in current_user
        get :index
      end

      it { is_expected.to respond_with :ok }

      describe 'POST #create' do

        context 'can only sell to other users, not self' do
          it 'own name is not available in the drop-down menu'
        end

        context 'with valid params' do
          it 'redirects to create page'
          it 'flashes success message'
        end

        context 'with invalid params' do
          it 'flashes error message'
        end
      end

  end # context 'when user is logged in'
end # ends RSpec describe
