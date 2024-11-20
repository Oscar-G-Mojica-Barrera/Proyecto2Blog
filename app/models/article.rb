class Article < ApplicationRecord
<<<<<<< HEAD
  has_many :comments, dependent: :destroy
end
=======
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,length: { minimum: 5 }
end
>>>>>>> 734aed9 (Actualizacion final)
