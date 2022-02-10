require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    #ルートURL（Homeページ）にGETリクエストを送る.
    get root_path
    #正しいページテンプレートが描画されているかどうか確かめる
    assert_template 'static_pages/home'
    #Home、Help、About、Contactの各ページへのリンクが正しく動くか
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
  end
end
