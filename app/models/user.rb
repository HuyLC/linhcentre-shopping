# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  enum gender: %i[Nam Nữ]

  %i[name phone].each do |e|
    validates_presence_of e
  end

  validates :phone, uniqueness: true

  before_save :set_titleize_for_name

  def full_address
    [address, ward, district, provide].compact.join(', ')
  end

  rails_admin do
    create do
      field :name
      field :gender
      field :phone
      field :address
      field :ward
      field :district
      field :provide
      field :facebook_profile
    end

    update do
      field :name
      field :gender
      field :phone
      field :address
      field :ward
      field :district
      field :provide
      field :facebook_profile
    end

    list do
      field :name
      field :gender
      field :phone
      field :full_address
      field :provide
      field :facebook_profile do
        pretty_value do
          %(<a href="#{value}" target="_blank">#{value}</a>).html_safe
        end
      end
      field :created_at
      configure :created_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
      field :updated_at
      configure :updated_at, :datetime do
        strftime_format '%d-%m-%Y %H:%M'
      end
    end

    show do
      field :name
      field :gender
      field :full_address
      field :phone
      field :facebook_profile do
        pretty_value do
          %(<a href="#{value}" target="_blank">#{value}</a>).html_safe
        end
      end
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

  def set_titleize_for_name
    self.address = address.titleize unless address.nil?
    self.ward = ward.titleize unless ward.nil?
    self.district = district.titleize unless district.nil?
    self.provide = provide.titleize unless provide.nil?
  end
end
