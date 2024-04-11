-- Dummy Users
INSERT INTO "User" (email, username, password) VALUES
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

-- Dummy Challenges
INSERT INTO "Challenge" (prompt, suggestion, date, source, image) VALUES
  ('Challenge 1 prompt', 'Challenge 1 suggestion', '2024-04-01T12:00:00Z', 'Source 1', 'image 1'),
  ('Challenge 2 prompt', 'Challenge 2 suggestion', '2024-04-02T12:00:00Z', 'Source 2', 'image 2'),
  ('Challenge 3 prompt', 'Challenge 3 suggestion', '2024-04-03T12:00:00Z', 'Source 3', 'image 3'),
  ('Challenge 4 prompt', 'Challenge 4 suggestion', '2024-04-04T12:00:00Z', 'Source 4', 'image 4'),
  ('Challenge 5 prompt', 'Challenge 5 suggestion', '2024-04-05T12:00:00Z', 'Source 5', 'image 5'),
  ('Challenge 6 prompt', 'Challenge 6 suggestion', '2024-04-06T12:00:00Z', 'Source 6', 'image 6'),
  ('Challenge 7 prompt', 'Challenge 7 suggestion', '2024-04-07T12:00:00Z', 'Source 7', 'image 7'),
  ('Challenge 8 prompt', 'Challenge 8 suggestion', '2024-04-08T12:00:00Z', 'Source 8', 'image 8'),
  ('Challenge 9 prompt', 'Challenge 9 suggestion', '2024-04-09T12:00:00Z', 'Source 9', 'image 9'),
  ('Challenge 10 prompt', 'Challenge 10 suggestion', '2024-04-10T12:00:00Z', 'Source 10', 'image 10');

-- Dummy Completions
INSERT INTO "Completion" (description, date, user_id, challenge_id) VALUES
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
