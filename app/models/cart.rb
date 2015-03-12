class Cart
  attr_accessor :content

  def initialize(content)
    @content = content || Hash.new
  end

  def add_item(item_id)
    @content[item_id] ||= 0
    @content[item_id] += 1
  end

  def total_quantity
    content.values.reduce(:+)
  end

  def remove_item(item_id)
    if @content[item_id] > 1
      @content[item_id] -= 1
    else
      @content.delete(item_id)
    end
  end

end
