require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:user) do
        User.create!(username: "Antonio", password: "password123")
    end

    it { should validate_presence_of(:username) }
  

    # describe "uniqueness" do
    #     before :each do
    #         create :user
    #     end

    #     it { should validate_uniqueness_of(:username)}
    #     it { should validate_uniqueness_of(:session_token)}
    # end

    # it { should validate_length_of(:password).is_at_least(6) }

    # describe " user::find_by_credentials " do
    #     it "does not show in database" do
    #         User.create!(username: "Antonio", password: "password123")
    #         user = User.find_by(username: "Antonio")
    #         expect(user.password).not_to be("password123")
    #     end

    #     it "create password use Bcrypt" do
            
    #     end
    # end
        
    describe 'password encryption' do
        # it 'encrypts password' do
        #   user = User.create(username: "Antonio", password: 'test')
        #   expect(user.password_digest).to_not eql 'test'
        #   expect(user.password_digest.class).to eq BCrypt::Password
        # end
        it "does not save passwords to the database" do
            User.create!(username: "Michelle", password: "password123")
            user = User.find_by(username: "Michelle")
            expect(user.password).not_to be("password123")
        end

        it "encrypts the password using BCrypt" do
            expect(BCrypt::Password).to receive(:create)
            User.new(username: "Michelle", password: "password123")
        end
    end




end