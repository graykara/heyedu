# frozen_string_literal: true

Trestle.resource(:course_chapters) do
  build_instance do |attrs, params|
    scope = params[:course_id] ? Course.find(params[:course_id]).course_chapters : CourseChapter
    scope.new(attrs)
  end

  form dialog: true do |chapter|
    if chapter.course
      hidden_field :course_id
    else
      select :course_id, Course.all
    end
    row do
      col(sm: 4) { number_field :seq }
      col(sm: 8) { text_field :title }
    end
    row do
      col { text_field :folder }
      col { number_field :pages }
      col { number_field :study_time, { append: :secs } }
    end
    row do
      col { text_field :file_prefix }
      col { text_field :start_name }
      col { text_field :file_ext }
    end
  end
end
