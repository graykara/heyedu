# frozen_string_literal: true

Trestle.resource(:posts) do
  menu do
    group :posts do
      item :posts, icon: 'fa fa-file'
    end
  end

  form do |post|
    row do
      col { select :category, Post.categories.keys.map  { |c| [c.humanize, c] } }
      col { select :status,   Post.statuses.keys.map    { |c| [c.humanize, c] } }
    end

    text_field :title
    rich_text_area :content
    if post.user
      select :user_id, User.all, { selected: post.user.id }
      row do
        col { text_field :ip }
        col { number_field :reading }
      end

      row do
        col { datetime_field :created_at }
        col { datetime_field :updated_at }
      end
    else
      select :user_id, User.all, { selected: current_user }
    end
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
  # form do |post|
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
  #   params.require(:post).permit(:name, ...)
  # end
end
