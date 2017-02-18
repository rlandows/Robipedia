class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

        has_many :wikis
        has_many :collaborations
        has_many :collaboration_wikis, through: :collaborations, :source => :wiki
  after_initialize { self.role ||= :standard }

  enum role: [:standard, :admin, :premium]
end
