# Ubuntu does not accept arguments to ruby when called using env. To get warnings to show up the -w options is
# required. That can be set in the RUBYOPT environment variable.
# export RUBYOPT=-w

$VERBOSE = true
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../test', __FILE__)

require 'minitest/autorun'
require 'minitest/around/unit'
require 'stringio'
require 'date'
require 'bigdecimal'
require 'pp'
require 'oj'

$ruby = RUBY_DESCRIPTION.split(' ')[0]
$ruby = 'ree' if 'ruby' == $ruby && RUBY_DESCRIPTION.include?('Ruby Enterprise Edition')

class Range
  def to_hash()
    { 'begin' => self.begin, 'end' => self.end, 'exclude_end' => self.exclude_end? }
  end
end
