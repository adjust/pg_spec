require "minitest/autorun"
require "minitest/pg_spec"
require "spec_helper"
describe 'compare' do

  cmp '5','>','4'
  cmp '5 + 5','<','4'
  is '5', '4'
  isnt '5', '5'
  matches "'this'", "'^that'"
  imatches "'this'", "'^that'"
  ok %q{5 + 5 = 10}
  isa( '5', "'bigint'")

  # it "should be nil" do
  #   assert_nil "foo"
  # end
end