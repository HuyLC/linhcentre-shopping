# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: %i[delivering delivered deleted]
  enum ship_method: %i[vnpost huy other]

  before_create :sum_total_price
  after_create :subtract_quantity_when_create_order
  after_update :sum_quantity_when_status_deleted

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

  def subtract_quantity_when_create_order
    return if order_items.size.zero?
    order_items.each do |e|
      next if e.is_substract
      e.product.quantity = e.product.quantity - e.quantity
      e.product.save
      e.is_substract
      e.save
    end
  end

  def sum_quantity_when_status_deleted
    return unless status == 'deleted'
    return if order_items.size.zero?
    order_items.each do |e|
      next if e.is_sum
      e.product.quantity = e.product.quantity + e.quantity
      e.product.save
      e.is_sum = true
      e.save
    end
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
      field :ship_method
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
      field :ship_method
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
      configure :order_date, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :status
      field :order_items
      field :ship_fee
      field :ship_method
      field :discount_percent
      field :discount_price
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
      field :user
      field :order_date
      configure :order_date, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :status
      field :order_items
      field :ship_fee
      field :ship_method
      field :discount_percent
      field :discount_price
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
