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
