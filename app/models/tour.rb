class Tour < ApplicationRecord
  belongs_to :category_id
  belongs_to :user_id
end
