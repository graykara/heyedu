# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                 :bigint           not null, primary key
#  code               :string           not null
#  height             :integer          default(720), not null
#  path               :string           not null
#  published          :boolean          default(FALSE)
#  title              :string           not null
#  width              :integer          default(1280), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  author_id          :bigint           not null
#  course_category_id :bigint           not null
#  cp_id              :bigint
#  pm_id              :bigint
#
# Indexes
#
#  index_courses_on_author_id           (author_id)
#  index_courses_on_course_category_id  (course_category_id)
#  index_courses_on_cp_id               (cp_id)
#  index_courses_on_pm_id               (pm_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (course_category_id => course_categories.id)
#  fk_rails_...  (cp_id => users.id)
#  fk_rails_...  (pm_id => users.id)
#
class Course < ApplicationRecord
  belongs_to :course_category
  belongs_to :author, class_name: 'User'
  belongs_to :pm, class_name: 'User'
  belongs_to :cp, class_name: 'User'

  has_one_attached :poster

  has_one :course_detail, dependent: :destroy, autosave: true
  has_many :course_chapters, dependent: :delete_all

  accepts_nested_attributes_for :course_detail
end
