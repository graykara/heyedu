# == Schema Information
#
# Table name: course_categories
#
#  id             :bigint           not null, primary key
#  children_count :integer          default(0), not null
#  code           :string
#  depth          :integer          default(0), not null
#  lft            :integer          not null
#  name           :string
#  rgt            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  parent_id      :integer
#
# Indexes
#
#  index_course_categories_on_code       (code)
#  index_course_categories_on_lft        (lft)
#  index_course_categories_on_parent_id  (parent_id)
#  index_course_categories_on_rgt        (rgt)
#
class CourseCategory < ApplicationRecord
  acts_as_nested_set
end
