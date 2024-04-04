-- Insert dummy users
INSERT INTO users (email, username, password)
VALUES 
    ('user1@example.com', 'user1', 'password1'),
    ('user2@example.com', 'user2', 'password2'),
    ('user3@example.com', 'user3', 'password3'),
    ('user4@example.com', 'user4', 'password4'),
    ('user5@example.com', 'user5', 'password5');

-- Insert dummy challenges
INSERT INTO challenges (description, date, source)
VALUES 
    ('Challenge 1', '2024-03-22T10:00:00', 'Source 1'),
    ('Challenge 2', '2024-03-23T11:00:00', 'Source 2'),
    ('Challenge 3', '2024-03-24T12:00:00', 'Source 3'),
    ('Challenge 4', '2024-03-25T13:00:00', 'Source 4'),
    ('Challenge 5', '2024-03-26T14:00:00', 'Source 5');

-- Insert dummy completions
INSERT INTO completions (description, date)
VALUES 
    ('Completion 1', '2024-03-22T10:00:00'),
    ('Completion 2', '2024-03-23T11:00:00'),
    ('Completion 3', '2024-03-24T12:00:00'),
    ('Completion 4', '2024-03-25T13:00:00'),
    ('Completion 5', '2024-03-26T14:00:00');

-- Insert dummy comments
INSERT INTO comments (body, date, user_id, completion_id)
VALUES 
    ('Comment 1', '2024-03-22T10:00:00', 1, 1),
    ('Comment 2', '2024-03-23T11:00:00', 2, 2),
    ('Comment 3', '2024-03-24T12:00:00', 3, 3),
    ('Comment 4', '2024-03-25T13:00:00', 4, 4),
    ('Comment 5', '2024-03-26T14:00:00', 5, 5);

-- Insert dummy reports
INSERT INTO reports (description, type, date)
VALUES 
    ('Report 1', 'Discrimination', '2024-03-22T10:00:00'),
    ('Report 2', 'Harassment', '2024-03-23T11:00:00'),
    ('Report 3', 'Violence', '2024-03-24T12:00:00'),
    ('Report 4', 'Scam', '2024-03-25T13:00:00'),
    ('Report 5', 'Abuse', '2024-03-26T14:00:00');

-- Insert dummy user completions
INSERT INTO user_completions (user_id, completion_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert dummy challenge completions
INSERT INTO challenge_completions (challenge_id, completion_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert dummy comment reports
INSERT INTO comment_reports (comment_id, report_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert dummy report creators
INSERT INTO report_creators (user_id, report_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert dummy completion reports
INSERT INTO completion_reports (completion_id, report_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
