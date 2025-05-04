SELECT TOP 1 
  person AS id, 
  COUNT(*) AS num
FROM (
  SELECT requester_id AS person, accepter_id AS friend FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS person, requester_id AS friend FROM RequestAccepted
) AS all_friends
GROUP BY person
ORDER BY COUNT(*) DESC;
