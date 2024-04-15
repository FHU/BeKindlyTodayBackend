import { describe } from "node:test";
import { test, expect, request } from "vitest";
import request from "supertest";

const URL = "https://app.swaggerhub.com/apis/GREENE8616/BeKindy/1.0.0/";

describe("USERS table tests", () => {
  test("GET from /api/v1/users", async () => {
    const res = await request(URL).get("/api/v1/users");
    expect(res.statusCode).toBe(200);
  });

  test("POST to /api/v1/users", async () => {
    const res = await request(URL)
      .post("/api/v1/users")
      .send({ username: "JohnDoe01", email: "JohnDoe@example.mail" });
    expect(res.statusCode).toBe(201);
    expect(res.body.username).toBe("JohnDoe01");
    expect(res.body.email).toBe("JohnDoe@example.mail");
  });

  test("PUT to /api/v1/users/1", async () => {
    const res = await request(URL)
      .put("/api/v1/users/1")
      .send({ name: "Jane Doe", age: 30 });
    expect(res.statusCode).toBe(200);
    expect(res.body.name).toBe("JaneDoe");
    expect(res.body.email).toBe("something@example.mail");
  });

  // test("DELETE /api/v1/users/1", async () => {
  //   const res = await request(URL).delete("/api/v1/users/1");
  //   expect(res.statusCode).toBe(204);
  // });
});

describe("CHALLENGES table tests", () => {
  test("GET all /challenges", async () => {
    const res = await request(URL).get("/api/v1/challenges/today");
    expect(res.statusCode).toBe(200);
  });

  test("GET from challenge with ID 1", async () => {
    const res = await request(URL).get("/api/v1/challenges/1");
    expect(res.statusCode).toBe(200);
  });

  test("POST to /challenges", async () => {
    const res = await request(URL)
      .post("/api/v1/challenges")
      .send({
        prompt: "Do something kind",
        description: "Do something kind for someone else",
        suggestion: "Buy someone a coffee",
        date: "2021-10-01",
        source: "ChatGPT",
        image: "https://example.com/image.jpg",
      });
    expect(res.statusCode).toBe(201);
    expect(res.body.prompt).toBe("Do something kind");
    expect(res.body.description).toBe("Do something kind for someone else");
    expect(res.body.suggestion).toBe("Buy someone a coffee");
    expect(res.body.date).toBe("2021-10-01");
    expect(res.body.source).toBe("ChatGPT");
    expect(res.body.image).toBe("https://example.com/image.jpg");

  });

  test("PUT to /challenges/1", async () => {
    const res = await request(URL)
      .put("/api/v1/challenges")
      .send({
        prompt: "Do nothing kind",
        description: "Do nothing kind for someone else",
        suggestion: "Buy no one a coffee",
        date: "2021-10-10",
        source: "Gemini",
        image: "https://example.com/image.png",
      });
    expect(res.statusCode).toBe(201);
    expect(res.body.prompt).toBe("Do nothing kind");
    expect(res.body.description).toBe("Do nothing kind for someone else");
    expect(res.body.suggestion).toBe("Buy no one a coffee");
    expect(res.body.date).toBe("2021-10-10");
    expect(res.body.source).toBe("Gemini");
    expect(res.body.image).toBe("https://example.com/image.png");
    
  });

  // test("DELETE /challenges/1", async () => {
  //   const res = await request(URL).delete("/api/v1/challenges/1");
  //   expect(res.statusCode).toBe(204);
  // });
});

describe("COMPLETIONS table tests", () => {
  test("GET all completions", async () => {
    const res = await request(URL).get("/api/v1/completions");
    expect(res.statusCode).toBe(200);
  });

  test("GET from completion with ID 1", async () => {
    const res = await request(URL).get("/api/v1/completions/1");
    expect(res.statusCode).toBe(200);
  });

  test("GET completion stats", async () => {
    const res = await request(URL).get("/api/v1/completions/stats");
    expect(res.statusCode).toBe(200);
  });

  test("POST to /completions", async () => {
    const res = await request(URL)
      .post("/api/v1/completions")
      .send({ description: "I did something kind"});
    expect(res.statusCode).toBe(201);
    expect(res.body.description).toBe("I did something kind");
  });

  // test("DELETE /completions/1", async () => {
  //   const res = await request(URL).delete("/api/v1/completions/1");
  //   expect(res.statusCode).toBe(204);
  // });
});
