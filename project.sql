WITH RECURSIVE 
messages_table (id, message) AS (
 SELECT 1, 'Congrats!'
  UNION
 SELECT 2, 'This is a tremendous accomplishment!'
  UNION
 SELECT 3, 'Now we can call each other colleagues in SQL.'
),

for_you_table (id, message, next_id) AS (
 SELECT id, message, id + 1
   FROM messages_table
  WHERE id = 1

  UNION ALL

 SELECT mt.id, fyt.message || ' ' || mt.message, mt.id + 1
   FROM messages_table mt
   JOIN for_you_table fyt
     ON mt.id = fyt.next_id
)

SELECT id, message, next_id
  FROM for_you_table
  WHERE id = 3;