class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_task
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_fee_task_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_day_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 299, less_than: 10000000, message: '半角数字を指定範囲内で入力してください'}
  validates :image, presence: true

end
