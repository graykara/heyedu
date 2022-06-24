# frozen_string_literal: true

class CreateCourseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :course_categories do |t|
      t.string :name, null: true
      t.string :code, null: true, index: true
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0

      t.timestamps
    end
  end
end
