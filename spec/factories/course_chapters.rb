# frozen_string_literal: true

# == Schema Information
#
# Table name: course_chapters
#
#  id          :bigint           not null, primary key
#  file_ext    :string           default("html")
#  file_prefix :string
#  folder      :string           not null
#  pages       :integer          not null
#  seq         :integer          not null
#  start_name  :string           default("01")
#  study_time  :integer          default(60)
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint           not null
#
# Indexes
#
#  index_course_chapters_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
FactoryBot.define do
  factory :course_chapter do
    course { nil }
    seq { 1 }
    title { 'MyString' }
    folder { 'MyString' }
    pages { 1 }
    study_time { 1 }
    file_prefix { 'MyString' }
    file_ext { 'MyString' }
    start_name { 'MyString' }
  end
end
