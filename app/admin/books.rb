ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  remove_filter :book_file_attachment, :book_file_blob, :cpics_attachments, :cpics_blobs
  permit_params :book_name, :price, :quantity, :author_id, :seller_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_name, :price, :quantity, :author_id, :seller_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
