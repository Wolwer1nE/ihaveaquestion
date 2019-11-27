require "test_helper"
require "minitest/autorun"

describe Post do
  it 'can not have empty body' do
    _(Post.create(title: 'some text').valid?).must_equal false
  end
end
