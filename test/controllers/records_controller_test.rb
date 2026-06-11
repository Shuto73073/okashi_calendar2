require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ユーザーを作成
    @user = User.create!(name: "Test User", password: "password")
    
    # ログイン処理
    post login_url, params: { name: @user.name, password: "password" }
    
    # テスト用のレコードを作成
    @record = Record.create!(
      date: Time.current,           
      snack_name: "Test Snack",     
      amount: Record::AMOUNTS[:medium],
      user: @user                   
    )
  end

  test "should get index" do
    get records_path
    assert_response :success
  end

  test "should get show" do
    get record_path(@record)
    assert_response :success
  end

  test "should get new" do
    get new_record_path
    assert_response :success
  end

  test "should get edit" do
    get edit_record_path(@record)
    assert_response :success
  end
end
