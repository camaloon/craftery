module ApplicationHelper
  def bootstrap_flash_type(conventional_type)
    {notice: 'success', alert: 'danger'}[conventional_type.to_sym]
  end

  def user_flash_type(conventional_type)
    {notice: 'Success', alert: 'Warning'}[conventional_type.to_sym]
  end
end
