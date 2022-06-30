# frozen_string_literal: true

class CreateCourseChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :course_chapters do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :seq, null: false, limit: 2
      t.string :title, null: false
      t.string :folder, null: false
      t.integer :pages, null: false, limit: 2
      t.integer :study_time, default: 60
      t.string :file_prefix
      t.string :file_ext, default: 'html'
      t.string :start_name, default: '01'

      t.timestamps
    end
  end
end
