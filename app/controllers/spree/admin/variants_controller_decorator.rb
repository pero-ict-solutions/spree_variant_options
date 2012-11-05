Spree::Admin::VariantsController.class_eval do

  def collection

    @deleted = (params.key?(:deleted) && params[:deleted] == "on") ? "checked" : ""

    if @deleted.blank?
      @collection ||= super
    else
      @collection ||= Variant.where(:product_id => parent.id).deleted
    end

    if params.key?(:option_values)
      @option_values = Spree::OptionValue.find(params[:option_values])
      @selected_option_types = @option_values.collect(&:option_type)
      @collection = parent.variants_for_option_values(@option_values)
    end


    @collection
  end

   def generate_for_option_types
    product = Spree::Product.find_by_permalink(params[:product_id])
    option_values_hash = {}
    product.option_types.each do |ot|
      option_values_hash[ot.id.to_s] = ot.option_value_ids
    end
    product.option_values_hash = option_values_hash
    product.send(:build_variants_from_option_values_hash)
    product.save
    redirect_to collection_url, :notice => "generated all the variants"
  end

end