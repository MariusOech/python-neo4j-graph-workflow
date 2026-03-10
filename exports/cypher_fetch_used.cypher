// QUERY 1: FETCH_NODES_ALL
MATCH (n)
WHERE n.id IS NOT NULL
RETURN
  n.id AS id,
  labels(n)[0] AS label,
  coalesce(n.name, n.id) AS name,
  coalesce(n.frequency, 0) AS frequency,
  coalesce(n.modules, 0) AS modules,
  coalesce(n.phase_mode, "") AS phase_mode,
  coalesce(n.competence_mode, "") AS competence_mode,
  coalesce(n.granularity_mode, "") AS granularity_mode

// QUERY 2: FETCH_EDGES_ALL
MATCH (a)-[r]->(b)
WHERE a.id IS NOT NULL AND b.id IS NOT NULL
RETURN
  a.id AS source,
  b.id AS target,
  type(r) AS type,
  coalesce(r.value, "") AS value
