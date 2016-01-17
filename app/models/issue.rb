class Issue < ActiveRecord::Base
  
  validates :year, presence: true,  numericality: { only_integer: true , allow_nil: true, greater_than: 1900, less_than: 2500}
  validates :volume, presence: true
  
  has_many :submissions
  #has_many :articles, dependent: :destroy

end
