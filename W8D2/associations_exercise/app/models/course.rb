class Course < ApplicationRecord
    has_many :enrollments,
        class_name: "Enrollment",
        primary_key: :id,
        foreign_key: :course_id

    belongs_to :users,
        class_name: "User",
        primary_key: :id,   
        foreign_key: :student_id 
end

# == Schema Information
#
# Table name: courses
#
#  id            :integer(8)      not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

