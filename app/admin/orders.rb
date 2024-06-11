ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  
  form do |f|
    f.inputs "User" do
      f.input :user_id, as: :select, collection: User.where(seller: 0).map { |user| [user.name, user.id] }
      f.input :book_id , as: :select, collection: Book.all.map { |book| [book.book_name, book.id] }
      f.input :seller_id , as: :select, collection: User.where(seller: 1).map { |user| [user.name, user.id] }
      f.input :quantity_of_book_order
      f.input :status
    end
    f.actions
  end

  permit_params :user_id, :book_id,:seller_id, :quantity_of_book_order, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :book_id, :seller_id, :quantity_of_book_order, :status, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
