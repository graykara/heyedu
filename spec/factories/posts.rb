# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  category   :string           default("notice")
#  ip         :string           default("127.0.0.1")
#  reading    :integer          default(0)
#  status     :string           default("draft")
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    category { 'notice' }
    status { 'draft' }
    title { 'Title' }
    body { 'Body' }
    user { nil }
    ip { '8.8.8.8' }
    reading { 0 }
  end
end
