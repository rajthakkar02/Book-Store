ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  remove_filter :book_image_attachment, :book_image_blob, :cpics_attachments, :cpics_blobs



  permit_params :book_name, :author_id, :seller_id, :price, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_name, :author_id, :seller_id, :price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
