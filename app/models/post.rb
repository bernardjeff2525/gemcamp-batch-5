class Post < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  validates :title, :content, presence: true

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  belongs_to :user
  belongs_to :region, class_name: 'Address::Region', foreign_key: 'address_region_id'
  belongs_to :province, class_name: 'Address::Province', foreign_key: 'address_province_id'
  mount_uploader :image, ImageUploader

  scope :recent, -> { order(created_at: :desc) }
  scope :today, -> { where('created_at >= ?', Time.current.beginning_of_day) }
  scope :filter_by_start_date, ->(start_date) {
    where('created_at >= ?', start_date)
  }
  scope :filter_by_end_date, ->(end_date) {
    where('created_at <= ?', end_date)
  }
  scope :filter_by_matching_title, ->(title) {
    where('title LIKE ?', "%#{title}%")
  }

  def destroy
    update(deleted_at: Time.current)
  end
end