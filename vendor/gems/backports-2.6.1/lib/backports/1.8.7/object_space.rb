module ObjectSpace
  class << self
    Backports.make_block_optional self, :each_object, :test_on => ObjectSpace
  end
end