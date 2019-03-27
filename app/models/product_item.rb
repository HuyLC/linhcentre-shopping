# frozen_string_literal: true

class ProductItem < ApplicationRecord
  belongs_to :product
  belongs_to :goods_receipt

  rails_admin do
    show do
      field :id
      field :product
      field :goods_receipt
      field :quantity
      field :created_at
      configure :created_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :updated_at
      configure :updated_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
    end
    list do
      field :id
      field :product
      field :goods_receipt
      field :quantity
      field :created_at
      configure :created_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :updated_at
      configure :updated_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
    end
  end
end
