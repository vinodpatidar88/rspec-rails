class UserProfile < ApplicationRecord
    enum :status, {active: 0, inactive: 1, pending: 2}
    belongs_to :user
end