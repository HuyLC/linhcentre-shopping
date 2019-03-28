# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :sum_total_price

  rails_admin do
    update do
      field :order
      field :product
      field :quantity
      field :total_price
      configure :total_price do
        read_only true
      end
    end

    create do
      field :order
      field :product
      field :quantity
      field :total_price
      configure :total_price do
        read_only true
      end
    end

    show do
      field :id
      field :order
      field :product
      field :quantity
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
      field :order
      field :product
      field :quantity
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

  private

  def sum_total_price
    self.total_price = quantity * product.retail_price
  end
end
