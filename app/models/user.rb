# frozen_string_literal: true

class User < ApplicationRecord
  enum gender: %i[Nam Nữ]


  def full_address
    [self.address, self.ward, self.district, self.provide].compact.join(', ')
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
  end

  rails_admin do
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
  end

  rails_admin do
    list do
      field :name
      field :gender
      field :phone
      field :full_address
      field :provide
      field :facebook_profile
      field :created_at
      field :updated_at
    end
  end

  rails_admin do
    show do
      field :name
      field :gender
      field :full_address
      field :phone
      field :facebook_profile
      field :created_at
      field :updated_at
    end
  end
end
