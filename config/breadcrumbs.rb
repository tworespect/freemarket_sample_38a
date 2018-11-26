crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :users_logout do
  link "ログアウト"
  parent :users
end


crumb :users_card do
  link "支払い方法",new_user_card_path
  parent :users
end

crumb :users_card_new do
  link "クレジットカード情報入力"
  parent :users_card

crumb :products do |product|
  link "#{ product.name }"
  parent :root

end
