require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe UsersController, :type => :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to create page'
      it 'flashes error message'
    end
    context 'with invalid params' do
      it 're-renders #new form'
    end
  end
end
