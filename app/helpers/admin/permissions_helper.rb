module Admin::PermissionsHelper
  def permissions
    {
        "view" => "View",
        "create tickets" => "Create Tickets",
        "edit tickets" => "Edit Tickets",
        "delete tickets" => "Delete Tickets",
        "change ticket states" => "Change Ticket States",
        "report time" => "Report Time",
        "manage time" => "Manage Time"
    }
  end
end
