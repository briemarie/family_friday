module FamiliesHelper
  def divisible_by_four?(size)
    size % 4 == 0
  end

  def divisible_by_five?(size)
    size % 5 == 0
  end
end
