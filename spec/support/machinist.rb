RSpec.configure do |config|
  config.before(:each) { Machinist.reset_before_test }
end

Machinist.configure do |config|
  config.cache_objects = false
end
