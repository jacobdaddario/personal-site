require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @base = User.create(name: "Joe")
  end

  test "accepts a valid user" do
  end

  test "denies name already in use" do
    @base.save
    @new_base = @base.dup
    assert_not @new_base.save, "App not forcing unique names"
  end

  test "denies name that is too long" do
    assert @base.save, "App limiting name length too much"
    @base = User.create(name: 'a' * 71)
    assert_not @base.save, "App not limiting name length"
  end

  test "user without name is invalid" do
    @base = User.create
    assert_not @base.save, "App not validating user name presence"
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
