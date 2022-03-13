class Delivery_fee_task < ActiveHash::Base
  self.data = [
    { id : 1, name: '--' },


  ]

  include ActiveHash::Associations
  has_many :items
end