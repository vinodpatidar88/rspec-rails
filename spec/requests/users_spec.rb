require "rails_helper"

RSpec.describe Users, type: :request do
  let(:user) { create(:user) }
   describe "user controller test" do
     it "user create" do
        params = 
          { name: "vpatidar", 
            age: 20, 
            status: 'active', 
            email: 'vinod#{rand(10..60)}dasd@gmail.com', 
            mobile_number: '8827877681',
            password: 'testing',
            password_confirmation: 'testing'
        }
        post '/api/v1/users', params: params

        # create fake/mock instance for testing only.
        service = instance_double(Users::CreateSerialiser)

        # creates a real instance of the class
        # service = Users::CreateSerialiser.new(params)
        allow(Users::CreateSerialiser).to receive(:new).and_return(service)

        #this line call real instance of class
        # service.call
        allow(service).to receive(:call).and_return(response)

        expect(response).to have_http_status(:created)
        json = JSON.parse(response.body)
        expect(json).to be_an(Object)
     end

     it "get All Users Data" do
       create_list(:user, 3)
       get '/api/v1/users'
       expect(response).to have_http_status(:ok)
     end

     it "get specific user data" do
       get "/api/v1/users/#{user.id}"
       expect(response).to be_successful
       json = JSON.parse(response.body)
       expect(json).to be_an(Object)
     end

     it "get specific user data not present" do
       get "/api/v1/users/9999399"
       expect(response).to have_http_status(:not_found)
       expect(response).to be_not_found
     end

     it "update user Details" do
       put "/api/v1/users/#{user.id}", params: {
        name: 'vinod n3334',
        password: '23233344', 
        password_confirmation: '23233344', 
        email: 'testing1234@gmail.com',
        status: 'active',
        mobile_number: '918788322223',
      }
      expect(response).to have_http_status(:no_content)
      expect(response).to be_no_content
     end


     it "edit apis for user data" do
       get "/api/v1/users/#{user.id}"
       expect(response).to have_http_status(:ok)
       expect(response).to be_successful
     end

    let(:user) { instance_double("User", full_name: "vinod") }

     it "user status update" do
       puts user.name
       patch "/api/v1/users/#{user.id}", params: {status: 'inactive'}
       expect(response).to have_http_status(:no_content)
       expect(response).to be_no_content
     end
   end
end