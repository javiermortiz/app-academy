class User < ApplicationRecord
    has_many :enrollments,
        class_name: "Enrollment",
        primary_key: :id,
        foreign_key: :student_id

    # has_many :enrolled_courses,
    #     class_name: "Course",
    #     primary_key: :id,
    #     foreign_key: :course_id
    # leverage exisitng relationship with through
    # through - name of another asso - must come from defining the total asso (ONLY asso listed in this model)
    # source - name of another asso (that exists in that enrollment model)
    has_many :enrolled_courses, 
        through: :enrollments,
        source: :course

    # has_many :professors,
    #     through: enrolled_courses,
    #     source: :course
        # (associations written inside the course model)
end

# == Schema Information
#
# Table name: users
#
#  id         :integer(8)      not null, primary key
#  name       :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

