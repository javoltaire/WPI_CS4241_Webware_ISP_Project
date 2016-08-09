require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user= User.new(first_name: "UserFirstName", last_name: "UserLastName", email: "UserEmail@email.com", password_digest: "UserPassword")  	
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end


  test "first name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a"*31
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a"*31
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*256
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "user@email.com"
    assert @user.valid?
  end

  test "email should not be valid" do
    @user.email = "some string"
    assert_not @user.valid?
  end

end
