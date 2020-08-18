crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", "#"
end

crumb :product_post do
  link "商品出品", new_product_path
end

crumb :product_edit do
  link "商品編集"
  parent :product_show, edit_product_path
end

crumb :product_show do
  link "商品詳細", product_path
end

crumb :product_buy do
  link "商品購入", "#"
  parent :product_show
end

crumb :product_buy do
  link "商品検索結果", search_products_path
end

crumb :user_new do
  link "新規登録（基本情報）", new_user_registration_path
end
crumb :user_address do
  link "新規登録（住所登録）", address_path
  parent :user_new
  
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).