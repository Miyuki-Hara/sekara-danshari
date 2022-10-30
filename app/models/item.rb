class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :let_go_way
  belongs_to :let_go_reason
  belongs_to :result

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :category_id
    validates :let_go_way_id
    validates :let_go_reason_id
    validates :result_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :let_go_way_id
    validates :let_go_reason_id
  end

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
