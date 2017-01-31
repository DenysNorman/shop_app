ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :phone, :status, :email

 form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Maine" do
   f.input :name
   f.input :phone
   f.input :email
   f.input :status, as: :select, collection: Order.status_keys.keys
  end
  f.actions
 end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
