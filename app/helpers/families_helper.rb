module FamiliesHelper
  def divisible_by(size)
    if size % 4 == 0
      return 4
    elsif size % 5 == 0
      return 5
    else
      return 3
    end
  end
end
