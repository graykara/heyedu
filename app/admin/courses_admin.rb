# frozen_string_literal: true

Trestle.resource(:courses) do
  menu do
    group 'courses' do
      item :courses, icon: 'fa fa-book'
    end
  end

  table do
    column :course_category
    column :code
    column :title
    column :published
  end

  form do |course|
    row do
      col do
        if course.persisted?
          select :course_category_id, CourseCategory.all.collect { |c|
            ["#{c.code} - #{c.name}", c.id]
          }.sort, { selected: course.course_category.id, include_blank: '-' }
        else
          select :course_category_id, CourseCategory.all.collect { |c|
            ["#{c.code} - #{c.name}", c.id]
          }.sort, { include_blank: '-' }
        end
      end
      col { text_field :code }
    end

    text_field :title
    text_field :path

    row do
      col { text_field :width }
      col { text_field :height }
    end

    row do
      col do
        if course.persisted?
          select :author_id, User.all, { selected: course.author_id, include_blank: '-' }
        else
          select :author_id, User.all, { include_blank: '-' }
        end
      end

      col do
        if course.persisted?
          select :pm_id, User.all, { selected: course.pm_id, include_blank: '-' }
        else
          select :pm_id, User.all, { include_blank: '-' }
        end
      end

      col do
        if course.persisted?
          select :cp_id, User.all, { selected: course.cp_id, include_blank: '-' }
        else
          select :cp_id, User.all, { include_blank: '-' }
        end
      end
    end

    sidebar do
      if course.poster.attached?
        form_group :poster, label: false do
          link_to image_tag(main_app.url_for(course.poster)), main_app.url_for(course.poster), data: { behavior: 'zoom' }
        end
      end

      file_field :poster
      datetime_field :created_at
      datetime_field :updated_at
      select :published, [true, false]
    end
  end
end
