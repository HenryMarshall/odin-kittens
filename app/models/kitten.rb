class Kitten < ActiveRecord::Base
  validate :name, presence: true
  validate :age, presence: true
  validate :cuteness, presence: true
  validate :softness, presence: true
end
