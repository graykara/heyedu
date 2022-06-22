# frozen_string_literal: true

module PostsHelper
  def page_index(page, idx, total, items)
    total - idx - ((page - 1) * items)
  end
end
