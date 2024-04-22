-- Dummy Users
INSERT INTO "users" (email, username, kinde_id) VALUES
  ('user1@example.com', 'user1', '1'),
  ('user2@example.com', 'user2', '2'),
  ('user3@example.com', 'user3', '3'),
  ('user4@example.com', 'user4', '4'),
  ('user5@example.com', 'user5', '5'),
  ('user6@example.com', 'user6', '6'),
  ('user7@example.com', 'user7', '7'),
  ('user8@example.com', 'user8', '8'),
  ('user9@example.com', 'user9', '9'),
  ('user10@example.com', 'user10', '10');


-- Dummy Completions
INSERT INTO "completions" (description, date, user_id, challenge_id) VALUES
  ('Completion 1 description', NOW() + interval '0 day', 1, 1),
  ('Completion 2 description', NOW() + interval '1 day', 2, 2),
  ('Completion 3 description', NOW() + interval '2 day', 3, 3),
  ('Completion 4 description', NOW() + interval '3 day', 4, 4),
  ('Completion 5 description', NOW() + interval '4 day', 5, 5),
  ('Completion 6 description', NOW() + interval '5 day', 6, 6),
  ('Completion 7 description', NOW() + interval '6 day', 7, 7),
  ('Completion 8 description', NOW() + interval '7 day', 8, 8),
  ('Completion 9 description', NOW() + interval '8 day', 9, 9),
  ('Completion 10 description', NOW() + interval '9 day', 10, 10);
