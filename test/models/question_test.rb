require "test_helper"
require "minitest/autorun"

describe Question do
  it 'can not have empty title' do
    _(Question.create(body: 'some text').valid?).must_equal false
  end
end
