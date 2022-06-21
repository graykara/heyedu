# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Pundit
  include Pundit::Authorization

  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :render_forbidden

  def render_forbidden
    render file: Rails.root.join('public', '403.html'), status: :forbidden, layout: false, content_type: 'text/html'
  end
end
