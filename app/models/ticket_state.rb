class TicketState < State
  self.inheritance_column="state_type"

  def default!
    unset_current_default!
    self.default = true
    self.save!
  end

  private

  def unset_current_default!
    current_default_state = TicketState.find_by_default(true)
    if current_default_state
      current_default_state.default = false
      current_default_state.save!
    end
  end

end
