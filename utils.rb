class Array
  # Just for easy to read code, that's all.
  def strip
    map(&:strip)
  end
end

class String
  # This splits the string separated by delimeter, but also keeps the delimeter
  # in result array thanks to grouping () in regex.
  def split_keeping(delimeter)
    split(/(#{delimeter})/)
  end
end
