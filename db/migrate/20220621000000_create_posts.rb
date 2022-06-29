# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :category, default: 'notice'
      t.string :status,   default: 'draft'
      t.string :title,    null: false
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :ip,       default: '127.0.0.1'
      t.integer :reading, default: 0

      t.timestamps
    end
  end
end
