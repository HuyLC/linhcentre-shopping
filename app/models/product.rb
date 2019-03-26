# frozen_string_literal: true

class Product < ApplicationRecord
  before_save :set_image_by_params_image
  mount_uploader :photo, ProductPhotoUploader
  attr_accessor :image_data

  rails_admin do
    update do
      field :name
      field :photo
      field :description, :ck_editor
      field :wholesale_price
      field :retail_price
      field :amount
    end
    create do
      field :name
      field :photo
      field :description, :ck_editor
      field :wholesale_price
      field :retail_price
      field :amount
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
      field :amount
      field :created_at
      field :updated_at
    end
    list do
      field :id
      field :name
      field :photo
      field :wholesale_price
      field :retail_price
      field :amount
      field :created_at
      field :updated_at
    end
  end

  private

  def set_image_by_params_image
    self.photo = ConvertImage.new(image_data).convert unless image_data.nil?
  end
end
