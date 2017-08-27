class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through :collaborators
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true

  scope :publicly_visible, -> { where(private: false) }

  #delegate :users, to: :collaborators

  #def collaborators
    #Collaborator.where(wiki_id: id)
  #end

  #def users
    #Users.where(id: collaborators.pluck(:user_id))
    #collaborators.users
  #end
end
