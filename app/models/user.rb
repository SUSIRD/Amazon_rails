class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  #Set Role
  enum role:[ :user, :admin ]

  before_create :set_default_user

  def set_default_user
    self.role = :user
  end

  def subscriptor?
    Subscriptor.all.map(&:email).include? self.email
  end
  


end
