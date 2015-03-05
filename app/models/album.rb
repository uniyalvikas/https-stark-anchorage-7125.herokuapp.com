class Album < ActiveRecord::Base
  #belongs_to :user
   belongs_to :user, :counter_cache => true
  has_many :pictures, :dependent => :destroy

  validates_presence_of :user_id
  validates_presence_of :caption
  validates_length_of   :caption, :within => 1..40
end
