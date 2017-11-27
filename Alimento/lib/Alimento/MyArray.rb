class MyArray < Array
  def initialize (values)
    super(values)
  end

  def each_sort
    new_array = []
    self.each_with_index do |value, iter|
      if (new_array.empty? == true)
	new_array.push(value)
      else
	new_array.each_with_index do |val2, iter2|
	  if (value < val2)
	    new_array.insert(iter2, val2)
	  end
	end
      end
    end
  end

  def for_sort
 
  end

end
