# ActiveAdmin.register Feedback do

#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # Uncomment all parameters which should be permitted for assignment

#   form do |f|
#     f.inputs do
#       f.input :user, as: :select, collection: User.all.map { |user| [user.email, user.id] }
#       f.input :comment
#       f.input :commentable_type
#       f.input :commentable_id 
#     end
#     f.actions
#   end
#   permit_params :comment, :user_id, :commentable_type, :commentable_id
#   #
#   # or
#   #
#   # permit_params do
#   #   permitted = [:comment, :user_id, :commentable_type, :commentable_id]
#   #   permitted << :other if params[:action] == 'create' && current_user.admin?
#   #   permitted
#   # end

# end
