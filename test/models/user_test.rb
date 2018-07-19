require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "accepts a valid user" do
  end

  test "denies invalid email" do
  end

  test "denies email already in use" do
  end

  test "denies email that is too long" do
  end

  test "user without email is invalid" do
  end

  test "changes the case of the email to lowercase" do
  end

  test "denies name already in use" do
  end

  test "denies name that is too long" do
  end

  test "user without name is invalid" do
  end

  test "denies info that is too long" do
  end

  test "user without info is invalid" do
  end

  test "denies user without avatar image" do
  end

  test "denies invalid avatar image" do
  end

  # TODO: Add password checks and add association checks
end
