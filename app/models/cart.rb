class Cart
  attr_reader :content

  def initialize(content)
    @content = content || Hash.new
  end

end
