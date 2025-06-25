-- models/movies_normalized.sql

SELECT
  data:_id::string                  AS id,
  data:title::string                AS title,
  data:year::string                 AS year,
  data:type::string                 AS type,
  data:runtime::int                 AS runtime,
  data:plot::string                 AS plot,
  data:fullplot::string             AS fullplot,
  data:lastupdated::timestamp_ntz   AS last_updated,
  data:num_mflix_comments::int      AS comment_count,

  -- IMDb
  data:imdb:id::int                 AS imdb_id,
  TRY_CAST(data:imdb:rating::string AS FLOAT) AS imdb_rating,
  TRY_CAST(data:imdb:votes::string AS INT) AS imdb_votes,

  -- Awards
  data:awards:wins::int             AS awards_wins,
  data:awards:nominations::int      AS awards_nominations,
  data:awards:text::string          AS awards_text,

  -- Tomatoes - flattening only top level
  data:tomatoes:consensus::string   AS tomatoes_consensus,
  data:tomatoes:production::string  AS tomatoes_production,
  data:tomatoes:dvd::timestamp_ntz  AS tomatoes_dvd,
  data:tomatoes:rotten::int         AS tomatoes_rotten,
  data:tomatoes:fresh::int          AS tomatoes_fresh
FROM {{ ref('movies_raw') }}
