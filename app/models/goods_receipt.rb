# frozen_string_literal: true

class GoodsReceipt < ApplicationRecord
  has_many :product_items, dependent: :destroy

  rails_admin do
    
    show do
      field :id
      field :receipt_date
      configure :receipt_date, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :product_items
      field :total_price
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
      field :receipt_date
      configure :receipt_date, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :product_items
      field :total_price
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
