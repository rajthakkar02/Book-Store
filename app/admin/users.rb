ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  index do
    column :seller_id
    column :name
    column :phone_no
    column :email
    column :seller
    column :created_at
    actions
  end

  form do |f|
    f.inputs "User" do
      f.input :seller_id
      f.input :name
      f.input :phone_no
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :seller
    end
    f.actions
  end
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone_no, :seller, :seller_id,:password_confirmation,:password
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone_no, :seller, :seller_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
