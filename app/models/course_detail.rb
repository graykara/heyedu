# frozen_string_literal: true

# == Schema Information
#
# Table name: course_details
#
#  id             :bigint           not null, primary key
#  certificate    :boolean          default(FALSE)
#  content_type   :string
#  goal_info      :text
#  intro_info     :text
#  pass_info      :string
#  period         :integer          default(30)
#  price          :integer          default(0)
#  price_info     :string
#  score_exam     :decimal(5, 2)
#  score_info     :string
#  score_progress :decimal(5, 2)
#  score_report   :decimal(5, 2)
#  study_point    :integer
#  support_devise :string
#  target_info    :text
#  total_time     :integer          default(30)
#  tutor_info     :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_id      :bigint           not null
#
# Indexes
#
#  index_course_details_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseDetail < ApplicationRecord
  belongs_to :course
end
