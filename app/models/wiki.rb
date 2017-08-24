class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true

  scope :publicly_visible, -> { where(private: false) }
  
end
