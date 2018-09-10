module ApplicationHelper
	# helper_method :resource_name, :resource, :devise_mapping, :resource_class

  
  def resource_name
    :driver
  end
 
  def resource
    @resource ||= Driver.new
  end

  def resource_class
    Driver
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:driver]
  end

end
