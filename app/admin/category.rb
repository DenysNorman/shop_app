ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :ancestry

  # next code for ancestry tree, but have some bags. need to fix
  # sortable tree: true,
  #          sorting_attribute: :ancestry,
  #          parent_method: :parent,
  #          children_method: :children,
  #          roots_method: :roots
  #
  # index :as => :sortable do
  #  label :title
  #  actions
  # end
  #
  # form do |f|
  #  f.semantic_errors *f.object.errors.keys
  #  f.inputs "Title" do
  #   f.input :title
  #   end
  #   f.actions
  # end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
