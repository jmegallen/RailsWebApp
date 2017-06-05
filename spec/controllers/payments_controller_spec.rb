require 'rails_helper'

describe PaymentsController, :type => :controller do

  context 'GET #create' do

    before do
      get :create
    end

    it 'responds with an HTTP 302 status code' do
      expect(response).to have_http_status(302)
    end

  end  
end


