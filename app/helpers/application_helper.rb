# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def flash_classes(flash_type)
    flash_base = 'px-2 py-4 mx-auto font-sans font-medium text-center text-white'
    {
      notice: "bg-indigo-600 #{flash_base}",
      error: "bg-red-600 #{flash_base}"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def nav_classes
    %w[devise/registrations devise/sessions devise/confirmations devise/passwords devise/unlocks].include?(params[:controller]) ? 'hidden' : nil
  end

  def label_class(options = {})
    "block mb-1 font-normal leading-normal #{options[:extended_classes]}"
  end

  def input_class(options = {})
    "block w-full border border-gray-300 rounded outline-none focus:outline-none focus:border-gray-400 focus-within:outline-none focus:ring-2 focus:ring-gray-200 #{options[:extended_classes]}"
  end

  def checkbox_class(options = {})
    "mr-1 text-blue-500 border border-gray-300 rounded focus:ring-2 focus:ring-gray-200 #{options[:extended_classes]}"
  end

  def link_class(options = {})
    "block text-gray-700 underline hover:no-underline hover:text-gray-800 #{options[:extended_classes]}"
  end

  def button_class(options = {})
    variant = options[:variant]
    theme = options[:theme]

    style_button(variant, theme_button(theme))
  end

  def theme_button(theme)
    themes = {
      primary: 'primary',
      secondary: 'secondary',
      transparent: 'transparent',
      dark: 'dark'
    }

    case theme
    when themes[:primary]
      'text-white bg-indigo-600 hover:bg-indigo-700'
    when themes[:secondary]
      'text-white bg-teal-600 hover:bg-teal-700'
    when themes[:transparent]
      'text-gray-700 bg-transparent hover:bg-gray-100'
    when themes[:dark]
      'text-white bg-gray-800 shadow-sm hover:bg-gray-900'
    else
      'bg-white border border-gray-300 shadow-sm hover:bg-gray-100'
    end
  end

  def style_button(variant, theme)
    base = 'font-sans font-normal font-medium leading-normal text-center transition duration-200 ease-in-out rounded outline-none cursor-pointer'

    case variant
    when 'large'
      "px-5 py-4 text-lg #{base} #{theme}"
    when 'small'
      "py-2 px-4 text-sm #{base} #{theme}"
    when 'expanded'
      "block w-full p-3 #{base} #{theme}"
    else
      "px-5 py-2 text-base #{base} #{theme}"
    end
  end

  def i_to_str(arg)
    if arg.to_i < 10
      "0#{arg}"
    else
      arg
    end
  end

  def time_to_date(arg)
    if arg.length.positive?
      "#{arg[5]}#{t('datetime.prompts.year')} #{arg[4]}#{t('datetime.prompts.month')} #{arg[3]}#{t('datetime.prompts.day')}"
    else
      '-'
    end
  end

  def time_to_day_month(arg)
    if arg.length.positive?
      "#{arg[4]}/#{arg[3]}"
    else
      '-'
    end
  end

  def time_to_dash(arg)
    if arg.length.positive?
      "#{arg[5]}-#{i_to_str(arg[4])}-#{i_to_str(arg[3])} #{i_to_str(arg[2])}:#{i_to_str(arg[1])}:#{i_to_str(arg[0])}"
    else
      '-'
    end
  end

  def time_to_min(arg)
    if arg.length.positive?
      "#{arg[5]}#{t('datetime.prompts.year')} #{i_to_str(arg[4])}#{t('datetime.prompts.month')} #{i_to_str(arg[3])}#{t('datetime.prompts.day')} #{i_to_str(arg[2])}#{t('datetime.prompts.hour')} #{i_to_str(arg[1])}#{t('datetime.prompts.minute')} #{i_to_str(arg[0])} #{t('datetime.prompts.second')}"
    else
      '-'
    end
  end

  def time_to_min_comma(arg)
    if arg.length.positive?
      "#{arg[5]}-#{i_to_str(arg[4])}-#{i_to_str(arg[3])} #{i_to_str(arg[2])}:#{i_to_str(arg[1])}:#{i_to_str(arg[0])}"
    else
      '-'
    end
  end

  def time_to_comma(arg)
    if arg.length.positive?
      "#{arg[5]}.#{i_to_str(arg[4])}.#{i_to_str(arg[3])}"
    else
      '-'
    end
  end
end
