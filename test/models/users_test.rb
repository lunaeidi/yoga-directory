class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  test "email addresses should be unique" do
   duplicate_user = @user.dup
   @user.save
   assert_not duplicate_user.valid?
 end

end
