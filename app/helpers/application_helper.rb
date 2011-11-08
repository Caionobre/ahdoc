module ApplicationHelper
# Defining custom titles for system
  def list_title
    content_tag :h1, t("title.list", :resource_name => resource_class.model_name.human(:count => :many))
  end

  def new_title(gender = 'male')
    content_tag :h1, t("title.new.#{gender}", :resource_name => resource_class.model_name.human)
  end

  def edit_title
    content_tag :h1, t("title.edit", :resource_name => resource_class.model_name.human)
  end

  def sign_in_title
    content_tag :h1, t("title.sign_in")
  end

# Defining custom links for system
  def new_link_to gender = "male"
    link_to t("link.new.#{gender}", :model => resource_class.model_name.human), new_resource_path
  end

  def edit_link_to object = nil
    object ||= resource
    
    link_to t("link.edit"), edit_resource_path(object)
  end

  def destroy_link_to object = nil
    object ||= resource
    
    link_to t("link.destroy"), resource_path(object), :method => :delete, :confirm => t("message.confirm.destroy")
  end

  def back_link_to
    link_to t("link.back"), collection_path
  end

  def up_link_to
    link_to parent.class.model_name.human, up_path
  end

  def logout_link_to
    link_to t("link.logout"), destroy_user_session_path, :confirm => t("message.confirm.logout")
  end
end
