# frozen_string_literal: true

Trestle.resource(:course_categories) do
  menu do
    item :course_categories, icon: 'fa fa-layer-group'
  end

  scopes do
    scope :all, -> { CourseCategory.all.order(:code) }, default: true
    scope '기술교육', -> { CourseCategory.find_by(code: :L01).self_and_descendants }
    scope '교원연수', -> { CourseCategory.find_by(code: :L02).self_and_descendants }
    scope '사이버교육', -> { CourseCategory.find_by(code: :L03).self_and_descendants }
  end

  table do
    column :parent_id, lambda { |parent|
      case parent.depth
      when 1
        parent.parent.name
      when 2
        "#{parent.parent.name} > #{parent.parent.parent.name}"
      when 3
        "#{parent.parent.name} > #{parent.parent.parent.name} > #{parent.parent.parent.parent.name}"
      else
        '-'
      end
    }
    column :name, link: true
    column :code, sort: { default: true, order: :asc }
  end

  form do
    text_field :name
    text_field :code
    divider
    select :parent_id, CourseCategory.all.collect { |c| ["#{c.code} - #{c.name}", c.id] }.sort, { include_blank: '-' }
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |course_category|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:course_category).permit(:name, ...)
  # end
end
