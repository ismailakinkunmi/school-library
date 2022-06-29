require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length < 10
      @nameable.correct_name
    else
      @nameable.correct_name[0, 10]
    end
  end
end
