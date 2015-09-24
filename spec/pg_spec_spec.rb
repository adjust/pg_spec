require "minitest/autorun"
require "minitest/pg_spec"
require "spec_helper"

describe 'compare' do

  cmp '5','>','6', "greater than"
  cmp '5 + 5','<','11'
  output '5+5', '10'
  # is '5', '4', '5 should be 4'
  # isnt '5', '5', '5 should not be 5'
  # matches "'this'", "'^that'", 'this should not math that'
  # imatches "'this'", "'^that'"
  # ok %q{5 + 5 = 10}
  # isa( '5', "'bigint'")
  # cmp 7,'>', 6, "greater than"


  # ok '5 > 4'
  # ok '5 > 6'




end