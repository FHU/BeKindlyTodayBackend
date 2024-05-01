import { describe } from "node:test";
import { test, expect, request } from "vitest";
import request from "supertest";

const URL = "http://localhost:5000";

test("should return status code 200", async () => {
  const res = await request(URL).get("/api/");
  expect(res.statusCode).toBe(200);
});

describe("USERS SUITE", () => {
  test("should get users and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/users/");
    expect(res.statusCode).toBe(200);
  });
});

describe("CHALLENGES SUITE", () => {
  test("should get today's challenge and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/challenges/today");
    expect(res.statusCode).toBe(200);
  });q

  test("should send bad request and return status code 400", async () => {
    const res = await request(URL).get("/api/v1/challenges/foobar/");
    expect(res.statusCode).toBe(400);
  });

  test("should request nonexistent challenge and return status code 404", async () => {
    const res = await request(URL).get("/api/v1/challenges/1000");
    expect(res.statusCode).toBe(404);
  });
});

describe("COMPLETIONS SUITE", () => {
  test("should get all completions and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/1");
    expect(res.statusCode).toBe(200);
  });

  test("should send bad request and get status code 400", async () => {
    const res = await request(URL).get("/api/v1/completions/foobar");
    expect(res.statusCode).toBe(400);
  });

  test("should request user stats and return status code 200", async () => {
    const res = await request(URL)
      .get("/api/v1/completions/stats")
      .send({ user_id: 1 });
    expect(res.statusCode).toBe(200);
  });

  test("should send bad request of completion based on id and return status code 400", async () => {
    const res = await request(URL).get("/api/v1/completions/foobar");
    expect(res.statusCode).toBe(400);
  });

  test("should request nonexistent completion and return status code 404", async () => {
    const res = await request(URL).get("/api/v1/completions/1000");
    expect(res.statusCode).toBe(404);
  });

  test("should post a new completion and return status code 201", async () => {
    const challengeId = 11;
    const userId = 11;
    const description = "Completion 11 description";

    const response = await request(URL)
      .post("/api/v1/completions")
      .send({
        challenge_id: challengeId,
        user_id: userId,
        description: description,
      });

    expect(response.status).toBe(201);
  });

  test("should try to post existing completion and return status code 303", async () => {
    const challengeId = 1;
    const userId = 1;
    const description = "Completion 1 description";

    const response = await request(URL)
      .post("/api/v1/completions")
      .send({
        challenge_id: challengeId,
        user_id: userId,
        description: description,
      });

    expect(response.status).toBe(303);
  });

  test("should delete a completion based on Id and return status code 204", async () => {
    const completionId = 11;

    const response = await request(URL).delete(
      `/api/v1/completions/${completionId}`
    );

    expect(response.status).toBe(204);
  });

  test("should attempt to delete a nonexistent completion and return status code 404", async () => {
    const response = await request(URL).delete(`/api/v1/completions/1000`);

    expect(response.status).toBe(404);
  });
});
