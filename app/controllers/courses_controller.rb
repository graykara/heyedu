# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: :show

  def index
    @courses = Course.all.order(id: :desc)
  end

  def show
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
