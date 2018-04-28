module Alert
  def create_alert(title, content, priority, user_id)
    if(Users.find(user_id).count > 0)
      alert = Alerts.new
      alert.title = title;
      alert.content = content;
      alert.priority = priority;
      alert.user_id = user_id;
      alert.create()
      return
    end
  end
end