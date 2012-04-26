require 'minitest/autorun'
require_relative '../spec_helper_lite.rb'

stub_module 'ActiveModel::Conversion'
stub_module 'ActiveModel::Naming'

require_relative '../../app/models/post'



describe Post do 

  before do 
    @it = Post.new
  end

  it "supports setting attribites in the initializer" do
    @it = Post.new(title: 'title', body: 'body')
    @it.title.must_equal 'title'
    @it.body.must_equal 'body'
  end

  it "starts with blank attributes" do
    @it.title.must_be_nil
    @it.body.must_be_nil
  end


  it "supports reading and writing title" do
    @it.title = 'title'
    @it.title.must_equal 'title'
  end

  it "supports reading and writing body" do
    @it.body = 'body'
    @it.body.must_equal 'body'
  end

  it "supports writing and reading blog reference" do
    blog = Object.new
    @it.blog = blog
    @it.blog.must_equal blog
  end

  describe "#publish" do 
    before do 
      @blog = MiniTest::Mock.new
      @it.blog = @blog
    end

    after do
      @blog.verify
    end
    
    it "adds a post the blog" do 
      @blog.expect :add_entry , nil, [@it]
      @it.publish
    end
    
  end
end
