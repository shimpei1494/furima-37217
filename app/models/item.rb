class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_task
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
end
