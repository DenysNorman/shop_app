ActiveAdmin.register Product do

  permit_params :title, :price, :description, :category_id, :photo, :in_stock,
                feature_values_attributes: [ :id, :feature_id, :title, :_destroy ],
                related_products_attributes: [ :id, :associated_id, :_destroy ]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Main" do
    f.input :title
    f.input :category
    f.input :price, as: :number
    f.input :description, as: :text
    f.input :photo, as: :file
    f.input :in_stock
    end

      f.inputs 'Add product feature' do
        f.has_many :feature_values, heading: 'Feature', allow_destroy: true do |fea|
          fea.input :feature, label: 'Feature'
          fea.input :title, label: 'Feature value'
        end
      end
    f.inputs 'Add association' do
      f.has_many :related_products, heading: 'Related product', allow_destroy: true do |a|
        a.input :associated, label: 'Association'
      end
    end

    f.action :submit
    end
end
