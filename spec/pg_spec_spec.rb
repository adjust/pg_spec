require "minitest/autorun"
require "spec_helper"

describe 'compare' do
  include PgSpec

  cmp '5','>','4', "greater than"
  cmp '5 + 5','<','11'
  output '5 + 5', '10'
  # results_eq ("SELECT i FROM generate_series(1,3) i", %w(1,2,3))
  results_eq "SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j",
              values(
                     r(1,1),
                     r(1,2),
                     r(2,1),
                     r(2,2)
                     )

  is '5', '5', '5 should be 5'
  isnt '5', '4', '5 should not be 4'
  matches "'this is awesome'", "'^this'", 'this is awsome should match this'
  imatches "'THIS is great'", "'^this'"
  ok %q{5 + 5 = 10}
  ok '5 > 4'
  isa( '5', "int")

  transaction do
    sql = <<-SQL
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
    SQL

    results_eq sql, values(r(1),r(2),r(3))
  end

end