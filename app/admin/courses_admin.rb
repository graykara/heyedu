# frozen_string_literal: true

Trestle.resource(:courses) do
  menu do
    group 'courses' do
      item :courses, icon: 'fa fa-book'
    end
  end

  table do
    column :course_category, link: false
    column :code
    column :title, link: true
    column :published
  end

  form do |course|
    tab :course do
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

    tab :course_detail do
      fields_for :course_detail, course.course_detail || course.build_course_detail do
        select :course_id, Course.all, { selected: course.id, disabled: true }

        form_group :intro_info do
          rich_text_area :intro_info
        end

        form_group :goal_info do
          rich_text_area :goal_info
        end

        form_group :target_info do
          rich_text_area :target_info
        end

        form_group :tutor_info do
          rich_text_area :tutor_info
        end

        text_field :study_point

        row do
          col { number_field :period, append: :days }
          col { number_field :total_time, append: :hours }
        end

        row do
          col(sm: 4) { number_field :price, append: '원' }
          col { text_field :price_info }
        end

        row do
          col { number_field :score_progress, append: '%' }
          col { number_field :score_exam, append: '%' }
          col { number_field :score_report, append: '%' }
        end

        text_field :score_info
        text_field :pass_info

        check_box :certificate
      end
    end

    tab :course_chapters, badge: course.course_chapters.size do
      table course.course_chapters, admin: :course_chapters do
        column :seq
        column :title
        column :folder
        column :pages
        column :study_time
        column :start_name
      end

      concat admin_link_to('New Chapter', admin: :course_chapters, action: :new, params: { course_id: course }, class: 'btn btn-success')
    end
  end
end
