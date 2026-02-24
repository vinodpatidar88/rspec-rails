class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    enum :status, {active: 0, inactive: 1, pending: 2}

    scope :status, ->(status) {where(status: status)}
end