SELECT 5 > 4
SELECT 5 > 4
SELECT pg_typeof(5) = 'int'::regtype
SELECT 5 + 5 < 11
SELECT 'this is awesome' ~ '^this'
SELECT 5 > 4
SELECT 5 <> 4
SELECT 5 > 4
BEGIN
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j
ROLLBACK
SELECT 'THIS is great' ~* '^this'
SELECT 5 + 5 = 10
SELECT 5 + 5
SELECT 5 = 5
SELECT 5 > 4
SELECT 5 + 5
SELECT pg_typeof(5) = 'int'::regtype
SELECT 5 + 5 = 10
SELECT 5 = 5
SELECT 5 <> 4
SELECT 'this is awesome' ~ '^this'
BEGIN
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
ROLLBACK
SELECT 'THIS is great' ~* '^this'
SELECT 5 > 4
BEGIN
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j
ROLLBACK
SELECT 5 + 5 < 11
SELECT 5 > 4
BEGIN
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j
ROLLBACK
BEGIN
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
ROLLBACK
SELECT 5 > 4
SELECT 5 + 5
SELECT 'THIS is great' ~* '^this'
SELECT 'this is awesome' ~ '^this'
SELECT 5 <> 4
SELECT pg_typeof(5) = 'int'::regtype
SELECT 5 + 5 < 11
SELECT 5 + 5 = 10
SELECT 5 = 5
SELECT 5 > 4;
SELECT 5 = 5;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5 = 10;
SELECT 5 > 4;
SELECT 5 + 5;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5 < 11;
SELECT 5 <> 4;
SELECT 'THIS is great' ~* '^this';
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 'this is awesome' ~ '^this';
SELECT 5 = 5;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 < 11;
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 <> 4;
SELECT 5 + 5 = 10;
SELECT 'this is awesome' ~ '^this';
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 5 > 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
BEGIN;
-- greater than
SELECT 5 > 4;
SELECT 5 + 5;
BEGIN;
SELECT 5 > 4;
SELECT 5 + 5 = 10;
-- 5 should be 5
SELECT 5 = 5;
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5 < 11;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 = 10;
SELECT 5 + 5 < 11;
SELECT 'THIS is great' ~* '^this';
-- 5 should not be 4
SELECT 5 <> 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 5 > 4;
-- greater than
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5;
SELECT 5 + 5 < 11;
SELECT 5 + 5 = 10;
-- 5 should not be 4
SELECT 5 <> 4;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 5 + 5;
SELECT 'THIS is great' ~* '^this';
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT pg_typeof(5) = 'int'::regtype;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 > 4;
-- greater than
SELECT 5 > 4;
-- 5 should be 5
SELECT 5 = 5;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 + 5 = 10;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- 5 should not be 4
SELECT 5 <> 4;
-- greater than
SELECT 5 > 4;
SELECT 5 + 5 < 11;
SELECT 'THIS is great' ~* '^this';
SELECT pg_typeof(5) = 'int'::regtype;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 > 4;
SELECT 5 + 5;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 < 11;
SELECT 5 + 5 = 10;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5;
SELECT 5 > 4;
-- 5 should be 5
SELECT 5 = 5;
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 'THIS is great' ~* '^this';
-- greater than
SELECT 5 > 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 < 11;
SELECT 5 + 5;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 > 4;
-- greater than
SELECT 5 > 4;
SELECT 5 + 5 = 10;
-- greater than
SELECT 5 > 4;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 5 + 5 < 11;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 = 10;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 = 10;
SELECT 5 + 5;
-- greater than
SELECT 5 > 4;
SELECT 5 > 4;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 + 5 < 11;
-- 5 should not be 4
SELECT 5 <> 4;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5;
SELECT 5 > 4;
SELECT 5 + 5 < 11;
SELECT pg_typeof(5) = 'int'::regtype;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 'THIS is great' ~* '^this';
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 = 10;
-- 5 should not be 4
SELECT 5 <> 4;
-- 5 should be 5
SELECT 5 = 5;
-- greater than
SELECT 5 > 4;
SELECT 5 + 5;
SELECT 5 + 5 = 10;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- greater than
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should not be 4
SELECT 5 <> 4;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 > 4;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 < 11;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 < 11;
-- greater than
SELECT 5 > 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 > 4;
-- 5 should be 5
SELECT 5 = 5;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 = 10;
SELECT 5 + 5;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5;
-- 5 should be 5
SELECT 5 = 5;
-- 5 should not be 4
SELECT 5 <> 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
-- greater than
SELECT 5 > 4;
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5 = 10;
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
SELECT 5 > 4;
SELECT 5 + 5 < 11;
SELECT 'THIS is great' ~* '^this';
SELECT pg_typeof(5) = 'int'::regtype;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 < 11;
SELECT 5 > 4;
SELECT 'THIS is great' ~* '^this';
SELECT 5 + 5 = 10;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5;
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:11
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- greater than
SELECT 5 > 4;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:11
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 > 4;
SELECT 5 + 5 = 10;
-- greater than
SELECT 5 > 4;
SELECT 5 + 5 < 11;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5;
SELECT 'THIS is great' ~* '^this';
SELECT pg_typeof(5) = 'int'::regtype;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5;
SELECT 'THIS is great' ~* '^this';
SELECT 5 > 4;
--spec/foo_spec.rb:11
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5 = 10;
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
-- greater than
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5 < 11;
SELECT pg_typeof(5) = 'int'::regtype;
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:11
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 > 4;
SELECT 5 + 5 < 11;
SELECT 5 + 5 = 10;
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 + 5;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 'THIS is great' ~* '^this';
-- 5 should be 5
SELECT 5 = 5;
SELECT 5 > 4;
SELECT 5 + 5 = 10;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5 < 11;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:11
BEGIN;
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
ROLLBACK;
-- greater than
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 'THIS is great' ~* '^this';
SELECT 5 > 4;
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5;
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5 < 11;
SELECT 'THIS is great' ~* '^this';
-- greater than
SELECT 5 > 4;
-- 5 should not be 4
SELECT 5 <> 4;
SELECT 5 + 5 = 10;
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
SELECT 5 + 5;
--spec/foo_spec.rb:21
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:8
SELECT 5 + 5 < 11;
--spec/foo_spec.rb:24
SELECT 5 > 4;
--spec/foo_spec.rb:25
SELECT pg_typeof(5) = 'int'::regtype;
--spec/foo_spec.rb:7
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:22
SELECT 'THIS is great' ~* '^this';
--spec/foo_spec.rb:20
-- 5 should not be 4
SELECT 5 <> 4;
--spec/foo_spec.rb:19
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
--spec/foo_spec.rb:23
SELECT 5 + 5 = 10;
--spec/foo_spec.rb:23
SELECT 5 + 5 = 10;
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:25
SELECT pg_typeof(5) = 'int'::regtype;
SELECT 5 + 5;
--spec/foo_spec.rb:19
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:20
-- 5 should not be 4
SELECT 5 <> 4;
--spec/foo_spec.rb:21
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:24
SELECT 5 > 4;
--spec/foo_spec.rb:22
SELECT 'THIS is great' ~* '^this';
--spec/foo_spec.rb:7
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:8
SELECT 5 + 5 < 11;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
--spec/foo_spec.rb:22
SELECT 'THIS is great' ~* '^this';
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
--spec/foo_spec.rb:19
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:20
-- 5 should not be 4
SELECT 5 <> 4;
--spec/foo_spec.rb:21
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
SELECT 5 + 5;
--spec/foo_spec.rb:7
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:8
SELECT 5 + 5 < 11;
--spec/foo_spec.rb:25
SELECT pg_typeof(5) = 'int'::regtype;
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:24
SELECT 5 > 4;
--spec/foo_spec.rb:23
SELECT 5 + 5 = 10;
--spec/foo_spec.rb:21
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:20
-- 5 should not be 4
SELECT 5 <> 4;
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:25
SELECT pg_typeof(5) = 'int'::regtype;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
--spec/foo_spec.rb:8
SELECT 5 + 5 < 11;
SELECT 5 + 5;
--spec/foo_spec.rb:22
SELECT 'THIS is great' ~* '^this';
--spec/foo_spec.rb:19
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:23
SELECT 5 + 5 = 10;
--spec/foo_spec.rb:24
SELECT 5 > 4;
--spec/foo_spec.rb:7
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:32
BEGIN;
      CREATE TABLE foo AS SELECT i FROM generate_series(1,3) i;
      SELECT * FROM foo;
;
ROLLBACK;
--spec/foo_spec.rb:22
SELECT 'THIS is great' ~* '^this';
--spec/foo_spec.rb:19
-- 5 should be 5
SELECT 5 = 5;
--spec/foo_spec.rb:25
SELECT pg_typeof(5) = 'int'::regtype;
--spec/foo_spec.rb:21
-- this is awsome should match this
SELECT 'this is awesome' ~ '^this';
--spec/foo_spec.rb:7
-- greater than
SELECT 5 > 4;
--spec/foo_spec.rb:8
SELECT 5 + 5 < 11;
SELECT 5 + 5;
--spec/foo_spec.rb:24
SELECT 5 > 4;
--spec/foo_spec.rb:23
SELECT 5 + 5 = 10;
--spec/foo_spec.rb:11
SELECT i,j FROM generate_series(1,2) i, generate_series(1,2) j;
--spec/foo_spec.rb:20
-- 5 should not be 4
SELECT 5 <> 4;
