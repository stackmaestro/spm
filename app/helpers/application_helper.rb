module ApplicationHelper
  def edit_link(resource, name = "Edit")
    link_to name, [:edit, resource], class: "edit-link"
  end
end
