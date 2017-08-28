class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, through: :collaborators
  has_many :collaborators


  #def collaborators
    #Collaborator.where(wiki_id: id)

  #end

  #def wikis
    #Wikis.where(id: collaborators.pluck(:wiki_id))
    #collaborators.wikis
  #end


  enum role: [:standard, :premium, :admin]

end
