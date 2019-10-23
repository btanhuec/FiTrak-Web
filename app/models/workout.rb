class Workout < ApplicationRecord
  belongs_to :user
  has_many :excercises, :dependent => :delete_all

end
