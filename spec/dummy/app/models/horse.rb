class Horse < ActiveRecord::Base

  has_paper_trail

  belongs_to :dummy_model

end
