require 'rails_helper'

RSpec.describe "Create Employees", type: :request do
  describe "POST /api/v1/employee" do
    context "with valid request" do
      it "should return 201 status " do
        employee = {employee: {first_name: "test_fist_name", last_name:"test_last_name"}}
        post "/employees", params: employee
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
      end
      it "should return correct obj " do
        employee = {employee: {first_name: "test_fist_name", last_name:"test_last_name"}}
        post "/employees", params: employee
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response_body).to include({
             first_name: "test_fist_name",
             last_name:"test_last_name"})
      end
    end
    context "with invalid request" do
      it "should return 201 status " do
        employee = {employee: {first_name: nil, last_name:"test_last_name"}}
        post "/employees", params: employee
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(422)
      end
      it "should return correct obj " do
        employee = {employee: {first_name: nil, last_name:"test_last_name"}}
        post "/employees", params: employee
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response_body).to include({first_name: ["can't be blank"],})
      end
    end
  end
end
