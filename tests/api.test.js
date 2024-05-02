import { describe } from 'node:test';
import { test, expect, request } from 'vitest';
import request from 'supertest';

const PORT = process.env.PORT;
const URL = `http://localhost:${PORT}`;

test("should return status code 200, 'pointless test'", async () => {
  const res = await request(URL).get('/api/');
  expect(res.statusCode).toBe(200);
});

describe('USERS SUITE', () => {
  describe('/:id SUITE', () => {
    test('should get user with id 1 and return status code 200', async () => {
      const res = await request(URL).get('/api/v1/users/1');
      expect(res.statusCode).toBe(200);
    });

    test('should send a bad request to get user and return status code 400', async () => {
      const res = await request(URL).get('/api/v1/users/Richard_Nixson');
      expect(res.statusCode).toBe(400);
    });

    test("should get user that doesn't exist and return status code 404", async () => {
      const res = await request(URL).get('/api/v1/users/1000000');
      expect(res.statusCode).toBe(404);
    });
  });

  describe('/stats SUITE', () => {
    test('should get stats for user with id 1 and return status code 200', async () => {
      const res = await request(URL).get('/api/v1/users/stats').send({ id: 3 });
      expect(res.statusCode).toBe(200);
    });

    test("should try to get stats for user that doesn't exist and return status code 404", async () => {
      const res = await request(URL)
        .get('/api/v1/users/stats')
        .send({ id: 1000000 });
      expect(res.statusCode).toBe(404);
    });
  });

  describe('/bio SUITE', () => {
    test('should update bio of user with id 1 and return status code 200', async () => {
      const res = await request(URL)
        .put('/api/v1/users/bio')
        .send({ id: 1, bio: 'This is the best bio' });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update bio user that doesn't exist", async () => {
      const res = await request(URL)
        .put('/api/v1/users/bio')
        .send({ id: 1000000, bio: 'This is the best bio' });
      expect(res.statusCode).toBe(404);
    });
  });

  describe('/profilepicture SUITE', () => {
    test('should update profilepicture of user with id 1 and return status code 200', async () => {
      const res = await request(URL)
        .put('/api/v1/users/profilepicture')
        .send({ id: 1, profilepicture: 'catpicture.png' });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update profilepicture user that doesn't exist", async () => {
      const res = await request(URL)
        .put('/api/v1/users/profilepicture')
        .send({ id: 1000000, profilepicture: 'catpicture.png' });
      expect(res.statusCode).toBe(404);
    });
  });

  describe('/username SUITE', () => {
    test('should update username of user with id 1 and return status code 200', async () => {
      const res = await request(URL)
        .put('/api/v1/users/username')
        .send({ id: 1, username: 'This is the best username' });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update username user that doesn't exist", async () => {
      const res = await request(URL)
        .put('/api/v1/users/username')
        .send({ id: 1000000, username: 'This is the best username' });
      expect(res.statusCode).toBe(404);
    });
  });
});

describe('CHALLENGES SUITE', () => {});

describe('COMPLETIONS SUITE', () => {});
