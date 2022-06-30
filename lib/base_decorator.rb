require_relative 'nameable' # rubocop:todo Layout/EndOfLine

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end
