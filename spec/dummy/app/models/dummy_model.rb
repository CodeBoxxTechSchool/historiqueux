class DummyModel < ActiveRecord::Base
  has_paper_trail

  has_many :horses

end
