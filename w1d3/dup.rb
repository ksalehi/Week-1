class Array
  def deep_dup
    arr_dup = []
    self.each do |el|
      if el.is_a?(Array)
        arr_dup << el.deep_dup
      else
        if el.is_a?(Fixnum) || el.is_a?(Symbol)
          arr_dup << el
        else
          arr_dup << el[0..-1]
        end
      end
    end
    arr_dup
  end
end
