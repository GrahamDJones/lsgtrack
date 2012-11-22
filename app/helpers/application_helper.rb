module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "LSG Tracker").join(" - ") unless parts.empty?
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end

  def authorized?(permission, thing, &block)
    block.call if current_user.try(:admin?) || can?(permission.to_sym, thing)
    nil
  end
end
