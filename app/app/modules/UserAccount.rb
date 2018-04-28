class UserAccount::user 
  def initialize(username)
    users = User.where(username: username)
    
    # Check that the user exists
    if(users.count > 0)
      self.exists = true
      self.the_user = users.first
    else
      self.exists = false
    end
  end
  
  def get
    if(self.exists)
      return self.the_user
    end
  end
end