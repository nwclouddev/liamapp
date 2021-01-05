class EventProblem < ApplicationRecord
  def expanded_desc
    expanded_desc = "#{code} - #{description}"
  end
end
