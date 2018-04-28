module Auth 
  def validate(username, password)
    users = User.where(
      username: username,
      password: password
     )
  end
end