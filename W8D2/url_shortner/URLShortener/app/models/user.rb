# == Schema Information
#
# Table name: users
#
#  id :integer(8)      not null, primary key
#

class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true
end