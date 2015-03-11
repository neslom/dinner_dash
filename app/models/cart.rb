class Cart
  attr_reader :content

  def initialize(content)
    @content = content || Hash.new
  end

  def add_item(item_id)
    @content[item_id] ||= 0
    @content[item_id] += 1
  end

end
