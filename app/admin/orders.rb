ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map { |user| [user.email, user.id]}
      f.input :book, as: :select, collection: Book.all.map { |book| [book.book_name, book.id] }
      f.input :quantity_of_book_order
    end
    f.actions
  end
  permit_params :user_id, :book_id, :quantity_of_book_order
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :book_id, :quantity_of_book_order]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
