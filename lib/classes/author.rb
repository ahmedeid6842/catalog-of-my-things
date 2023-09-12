class Author
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = Random.rand(1...1000)
    @items = []
  end
end
