# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :course_category, null: false, foreign_key: true
      t.string :code, null: false
      t.string :title, null: false
      t.string :path, null: false
      t.integer :width, null: false, default: 1280
      t.integer :height, null: false, default: 720
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :pm, null: true, foreign_key: { to_table: :users }
      t.references :cp, null: true, foreign_key: { to_table: :users }
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
