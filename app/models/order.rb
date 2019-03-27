# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: %i[delivering delivered]

  before_save :sum_total_price

  private

  def sum_total_price
    self.total_price = 0
    order_items.each do |e|
      self.total_price = total_price + e.total_price
    end
    self.total_price = total_price + ship_fee

    self.total_price =  total_price - (total_price * discount_percent / 100) if discount_percent.present?

    self.total_price =  total_price - discount_price if discount_price.present?
  end


  rails_admin do
    update do
      field :id
      configure :id do
        read_only true
      end
      field :user
      field :order_date
      field :status
      field :order_items
      field :ship_fee
      field :discount_percent
      field :discount_price
      field :total_price
      configure :total_price do
        read_only true
      end
    end

    create do
      field :id
      configure :id do
        read_only true
      end
      field :user
      field :order_date
      field :status
      field :order_items
      field :ship_fee
      field :discount_percent
      field :discount_price
      field :total_price
      configure :total_price do
        read_only true
      end
    end

    show do
      field :id
      field :user
      field :order_date
      field :status
      field :order_items
      field :ship_fee
      field :discount_percent
      field :discount_price
      field :order_date
      field :total_price
      field :created_at
      field :updated_at
    end

    list do
      field :id
      field :user
      field :order_date
      field :status
      field :order_items
      field :ship_fee
      field :discount_percent
      field :discount_price
      field :total_price
      field :created_at
      field :updated_at
    end
  end
end