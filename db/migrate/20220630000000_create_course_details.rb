# frozen_string_literal: true

class CreateCourseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :course_details do |t|
      t.references :course, null: false, foreign_key: true
      t.string :support_devise
      t.string :content_type
      t.text :intro_info
      t.text :goal_info
      t.text :target_info
      t.text :tutor_info
      t.integer :study_point
      t.integer :period, default: 30
      t.integer :total_time, default: 30
      t.integer :price, default: 0
      t.string :price_info
      t.decimal :score_progress, precision: 5, scale: 2
      t.decimal :score_exam, precision: 5, scale: 2
      t.decimal :score_report, precision: 5, scale: 2
      t.string :score_info
      t.string :pass_info
      t.boolean :certificate, default: false

      t.timestamps
    end
  end
end
