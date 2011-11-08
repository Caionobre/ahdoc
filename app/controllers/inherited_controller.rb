class InheritedController < ApplicationController
  inherit_resources

  def create
    create! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end

protected
  def resource_form_path
    resource.persisted? ? resource_path : collection_path
  end

  helper_method :resource_form_path
end