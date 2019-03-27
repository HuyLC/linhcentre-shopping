# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  before_save :set_image_by_params_image
  before_save :set_titleize_for_name
  mount_uploader :photo, ProductPhotoUploader
  attr_accessor :image_data

  %i[retail_price].each do |e|
    validates_presence_of e
  end

  rails_admin do
    update do
      field :name
      field :photo
      field :description, :ck_editor
      field :wholesale_price
      field :retail_price
      field :quantity
    end
    create do
      field :name
      field :photo
      field :description, :ck_editor
      field :wholesale_price
      field :retail_price
      field :quantity
    end

    show do
      field :id
      field :name
      field :photo
      field :description do
        pretty_value do
          value.html_safe
        end
      end
      field :wholesale_price
      field :retail_price
      field :quantity
      field :created_at
      field :updated_at
    end
    list do
      field :id
      field :name
      field :photo
      field :wholesale_price
      field :retail_price
      field :quantity
      field :created_at
      field :updated_at
    end
  end

  private

  def set_image_by_params_image
    self.photo = ConvertImage.new(image_data).convert unless image_data.nil?
  end

  def set_titleize_for_name
    self.name  = name.titleize
  end
end
