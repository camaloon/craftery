require 'spec_helper'

describe SessionController do

  describe "POST 'create'" do

    context "User 'test' exists in the database" do
      let! { create :user, username: 'test', password: 'pass' }

      it "Rejects logins with wrong passwords" do
        post 'create', session: {
            username: 'test',
            password: 'WRONG_PASSWORD',
        }
        response.should_not redirect_to root_path
      end

    end

  end

end
