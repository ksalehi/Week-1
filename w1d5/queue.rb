class Queue
  attr_accessor :obj

  def initialize
    @obj = []
  end

  def enqueue(el)
    obj.unshift(el)
  end

  def dequeue
    obj.pop
  end

  def show
    p obj
  end
end
