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
FactoryBot.define do
  factory :course_detail do
    course { nil }
    support_devise { 'MyString' }
    content_type { 'MyString' }
    intro_info { 'MyText' }
    goal_info { 'MyText' }
    target_info { 'MyText' }
    tutor_info { 'MyText' }
    study_point { 1 }
    period { 1 }
    total_time { 1 }
    price { 1 }
    price_info { 'MyString' }
    score_progress { '9.99' }
    score_exam { '9.99' }
    score_report { '9.99' }
    score_info { 'MyString' }
    pass_info { 'MyString' }
    certificate { false }
  end
end
