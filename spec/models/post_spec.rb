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
require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(title: 'Anything',
                        body: 'Anything',
                        user_id: User.first.id,
                        created_at: DateTime.now,
                        updated_at: DateTime.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is is not valid without a body' do
    subject.body = nil
    expect(subject).not_to be_valid
  end
end
