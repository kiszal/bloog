class Blog 
  attr_accessor :entries
  attr_writer :post_source

  def initialize
    @entries = []
  end
  
  def title
    "Watching Paint Dry"
  end 

  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  def new_post
    post_source.call.tap do |p|
      p.blog = self
    end
  end

  private

  def post_source
    @post_source ||= Post.public_method(:new)
  end
end
