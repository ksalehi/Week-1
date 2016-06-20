class Stack
  def initialize
    @obj = []
  end

  def add(el)
    @obj.push(el)
  end

  def remove
    @obj.pop
  end

  def show
    p @obj
  end
end
