class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true

  def publicwikis
    wikis.where(private: false)
  end

  private

  def privatewikis
    wikis.where(private: true)
  end
  #scope :visible_to, -> (user) { current_user && (current_user.premium? || current_user.admin?) ? all : where(private: false)}
  scope :publicly_visible, -> (user) {where(private: false)}

end
