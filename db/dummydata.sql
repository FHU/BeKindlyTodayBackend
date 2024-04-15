-- Dummy Users
INSERT INTO "user" (email, username, password) VALUES
  ('user1@example.com', 'user1', 'password1'),
  ('user2@example.com', 'user2', 'password2'),
  ('user3@example.com', 'user3', 'password3'),
  ('user4@example.com', 'user4', 'password4'),
  ('user5@example.com', 'user5', 'password5'),
  ('user6@example.com', 'user6', 'password6'),
  ('user7@example.com', 'user7', 'password7'),
  ('user8@example.com', 'user8', 'password8'),
  ('user9@example.com', 'user9', 'password9'),
  ('user10@example.com', 'user10', 'password10');


-- Dummy Completions
INSERT INTO "completion" (description, date, user_id, challenge_id) VALUES
  ('Completion 1 description', '2024-04-01T12:00:00Z', 1, 1),
  ('Completion 2 description', '2024-04-02T12:00:00Z', 2, 2),
  ('Completion 3 description', '2024-04-03T12:00:00Z', 3, 3),
  ('Completion 4 description', '2024-04-04T12:00:00Z', 4, 4),
  ('Completion 5 description', '2024-04-05T12:00:00Z', 5, 5),
  ('Completion 6 description', '2024-04-06T12:00:00Z', 6, 6),
  ('Completion 7 description', '2024-04-07T12:00:00Z', 7, 7),
  ('Completion 8 description', '2024-04-08T12:00:00Z', 8, 8),
  ('Completion 9 description', '2024-04-09T12:00:00Z', 9, 9),
  ('Completion 10 description', '2024-04-10T12:00:00Z', 10, 10);
