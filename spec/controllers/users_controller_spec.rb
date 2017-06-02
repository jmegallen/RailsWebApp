require 'rails_helper'

describe UsersController, type: :controller do

  before do
    # @user = FactoryGirl.create(:user)
    @user1 = FactoryGirl.create(:user)
    # @user2 = FactoryGirl.create(:user)
    # @user1 = User.create!(first_name: "Jimmy", last_name: "Walsh", email: "jimw@gmail.com", password: "123456", admin: false)
    # @user2 = User.create!(first_name: "Jonny", last_name: "Gallen", email: "jong@gmail.com", password: "567891", admin: true)
  end

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in @user1
      end
      
      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      # it 'other users profile restricted' do
      #   get :show, params: { id: @user2.id }
      #   expect(response).to redirect_to(root_path)
      # end
      
    end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user1.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end

  end

end