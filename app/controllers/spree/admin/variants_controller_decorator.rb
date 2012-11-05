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

end