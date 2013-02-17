require 'spec_helper'

describe ReminderController do

  describe "GET 'date'" do
    it "returns http success" do
      get 'date'
      response.should be_success
    end
  end

end
