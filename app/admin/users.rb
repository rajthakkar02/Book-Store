ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  index do
    column :id
    column :name
    column :phone_no
    column :email
    column :seller
    column :created_at
    actions
  end

  form do |f|
    f.inputs "User" do
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

  show do
    attributes_table do
      row :name
      row :phone_no
      row :email
      row :seller
    end
    panel "Actions" do
      if user.seller
        link_to 'Send Reset Password and Update to Seller', send_reset_password_admin_user_path(user), method: :put
      end
    end
  end

  member_action :send_reset_password, method: :put do
    user = User.find(params[:id])
    user.update(seller: true)
    user.send_invitation_email
    redirect_to admin_user_path(user), notice: "Reset password instructions sent to #{user.email} and updated to seller."
  end

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone_no, :seller, :password, :password_confirmation
end
