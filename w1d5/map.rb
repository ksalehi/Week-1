class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key).nil?
      map << [key, value]
    else
      assignment = map.select {|pair| pair.first == key}
      assignment.last = value
    end
  end

  def lookup(key)
    map.each do |pair|
      if pair.first == key
        return pair.last
      end
    end
    nil
  end

  def remove(key)
    if lookup(key).nil?
      raise "This key does not exist"
    else
      map.each do |pair|
        if pair.first == key
          map.delete([pair.first, pair.last])
        end
      end
    end
    map
  end

  def show
    p map
  end

end
