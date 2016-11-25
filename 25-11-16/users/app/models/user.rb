# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :profile, foreign_key: :user_id
	has_many :contacts, :foreign_key => "user_id"
    has_one :address, foreign_key: :user_id
	# validates :first_name, presence:true
	# validates :last_name, presence:true
	# validates :email, presence: true, email: true
	# validates :username,  presence:true,uniqueness: true
	# validates :password,  presence:true
	# validates :password_confirmation, presence:true
	# validates :password, confirmation:{ case_sensitive: false }
	# validates :mobile, length: {is: 10}, numericality: true
	# validates :fax, numericality: true
	# validate :country_cant_be_blank
	# def country_cant_be_blank
	# 	if country.blank?
	# 		errors.add(:country, "select country")
	# 	end
	# end


	accepts_nested_attributes_for :profile, :address
end