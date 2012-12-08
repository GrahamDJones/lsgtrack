class ProjectState < State
  self.inheritance_column="state_type"
  attr_accessible :is_admin_only

  private

  def unset_current_default!
    current_default_state = ProjectState.find_by_default(true)
    if current_default_state
      current_default_state.default = false
      current_default_state.save!
    end
  end

end
