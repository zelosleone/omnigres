-- Test operator for cross-schema type namespace validation
-- This operator is used in tests to verify that the dependency view
-- correctly identifies type namespaces when operator and types are in different schemas

create function object_id_matches_text(pg_catalog.text, omni_schema.object_id)
returns boolean
language sql
immutable
as $$
  select false; -- Dummy function for testing metadata only
$$;

create operator ~~~ (
  leftarg = pg_catalog.text,
  rightarg = omni_schema.object_id,
  procedure = object_id_matches_text,
  commutator = ~~~
);
