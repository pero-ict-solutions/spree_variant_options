Deface::Override.new(:virtual_path   => "spree/products/_cart_form",
                     :name           => "spree_variant_options",
                     :replace        => "#product-variants",
                     :partial        => "spree/products/variant_options",
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/option_types/edit",
                     :name           => "admin_option_value_table_headers",
                     :replace        => "thead[data-hook=option_header]",
                     :partial        => "spree/admin/option_values/table_header",
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/option_types/edit",
                     :name           => "admin_option_value_table_empty_colspan",
                     :set_attributes => "tr[data-hook=option_none] td",
                     :attributes     => { :colspan => 5 },
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/option_types/edit",
                     :name           => "admin_sortable_option_values",
                     :set_attributes => "table.index",
                     :attributes     => {
                       "class"              => "index sortable",
                       "data-sortable-link" => "/admin/option_values/update_positions"
                     },
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/variants/index",
                     :name           => "add_option_type_value_filter_headers",
                     :insert_before  => "table.index",
                     :partial        => "spree/admin/variants/filters",
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/option_types/edit",
                     :name           => "multiple_option_values_upload",
                     :insert_after   => "span#new_add_option_value",
                     :partial        => "spree/admin/option_types/multiple_upload_values",
                     :disabled       => false)

Deface::Override.new(:virtual_path   => "spree/admin/shared/_product_tabs",
                     :name           => "add_build_variants_button",
                     :insert_before  => "h1",
                     :partial        => "spree/admin/variants/build_variants_button",
                     :disabled       => false)

