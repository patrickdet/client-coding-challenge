# frozen_string_literal: true

# Minitest
require 'minitest/autorun'
require 'minitest/hooks/default'
require 'minitest/stub_any_instance'

# Helper
require 'mocha/minitest'

# Debugging
require 'pry'

class Minitest::Test
  make_my_diffs_pretty!
end
