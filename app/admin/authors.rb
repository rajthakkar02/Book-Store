ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.where(seller: 1).map { |user| [user.name, user.id] }
      f.input :name
      f.input :email
    end
    f.actions
  end
  permit_params :name, :email, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :seller_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
