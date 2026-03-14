class User < ApplicationRecord
    has_secure_password
    has_one_attached :image
    has_one_attached :video
    has_many :user_profiles
    validate :user_mobile_number
    validates :email, presence: true, uniqueness: true, if: -> { mobile_number.blank? }
    validates :age, numericality: true
    # validates :mobile_number, format: {with: /\A\d{10}\z/, message: "must be 10 digits"}
    enum :status, {active: 0, inactive: 1, pending: 2}
    validates :password, length: {minimum:3, maximum:50}, if: ->{ password_confirmation.present? || password.present? }

    def self.my_lambda
      ->(x) { 
        {message: 'return successfully', result: x * 2}
     } 
    end

    def user_mobile_number
        if mobile_number.blank?
        errors.add(:mobile_number, "can't be blank")
        end
    end

    def self.greet
        "hello default method"
    end
end