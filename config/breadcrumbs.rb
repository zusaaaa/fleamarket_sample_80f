crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", "#"
end
crumb :card_new do
  link "クレジットカード登録", new_card_path
  parent :mypage
end
crumb :card_show do
  link "クレジットカード確認", card_path
  parent :card_new
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
crumb :product_purchase do
  link "購入確認", purchase_product_path
  parent :product_show
end
