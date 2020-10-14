require 'rails_helper'

 RSpec.describe UsersController, type: :controller do
    
    let(:user) do 
        User.create!(username: "Antonio", password: "Newyork001")
    end

    describe "get#show" do 
        it "should render show page" do 
            
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)

        end
    end

    describe "get#index" do
        it "should render index page" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "post #create" do
        let(:valid_params) {
            {
                user: {
                    username: "Alex",
                    password: "password123"
                }
            }
        }

        let(:invalid_params) {
            {
                user: {
                    username: "Kathy",
                    password: "password123"
                }
            }
        }

        context "with invalid params" do
            it "creates user" do
                post :create, params: valid_params
                expect(User.last.username).to eq("Alex")
            end
            it "redirect to show page" do
                # expect(response).to redirect_to(user_url(User.last.id))
                expect(response).render_template(users_url)
            end
        end
    end


    

 end