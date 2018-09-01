require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @base = User.new(name: "Example User", email: "user@example.com",
                     info: 'a' * 255, avatar: 'jacob_auth.JPG',
                     password: "foobar", password_confirmation: "foobar")
  end

  test "accepts a valid user" do
    assert @base.valid?, "Base user should be valid. #{@base.errors.details}"
  end

  test "unique name" do
    @base.save
    new_base = @base.dup
    new_base.email = 'new@gmail.com'
    assert_not new_base.valid?, "App not forcing unique names"
  end

  test "name max length 70" do
    @base.name = 'a' * 71
    assert_not @base.valid?, "App not limiting name length"
  end

  test "name required" do
    @base.name = nil
    assert_not @base.valid?, "App not validating user name presence"
  end

  test "unique email" do
    @base.save
    @new_base = @base.dup
    @new_base.name = "Steve"
    assert_not @new_base.valid?, "App is not denying duplicate"
  end

  test "email max length 255" do
    @base.email = "a" * 246 + "@gmail.com"
    assert_not @base.valid?, "App does not consider #{@base.email.length} characters too long"
  end

  test "email required" do
    @base.email = nil
    assert_not @base.valid?, "App is not checking for user's email"
  end

  test "accepts valid email addresses" do
    # %w creates a double quote strings inside an array
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @base.email = address
      assert @base.valid?, "#{address} should be valid"
    end
  end

  test "denies invalid email address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |address|
      @base.email = address
      assert_not @base.valid?, "#{address} should be invalid"
    end
  end

  # This is key to uniqueness actually functioning correctly
  test "downcases email before validation" do
    @new_base = User.new(name: "Steve Failure", email: "Jake.daddario@gmail.com")
    assert_not @new_base.valid?, "App not downcasing email"
  end

  test "info max length 255" do
    @base.info = "a" * 256
    assert_not @base.valid?, "App is not limiting info enough"
  end

  test "info rquired" do
    @base.info = ''
    assert_not @base.valid?, "App is not requiring author info"
  end

  test "requires avatar image" do
    @base.avatar = ''
    assert_not @base.valid?, "App not requiring author image"
  end

  test "requires valid image" do
    @base.avatar = "jacob_auth"
    assert_not @base.valid?, "App not requiring proper image extensions"
    @base.avatar = "asdf.JPG"
    assert_not @base.valid?, "App not requiring a valid image in the asset path"
  end

  test "requires a password" do
    @base.password = @base.password_confirmation = ' ' * 6
    assert_not @base.valid?, "App not requiring a non-blank password"
  end

  test "password minimum length 6" do
    @base.password = @base.password_confirmation = 'a' * 5
    assert_not @base.valid?, "App not enforcing password length"
  end

end
