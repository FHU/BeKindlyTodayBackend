import { describe } from "node:test";
import { test, expect, request } from "vitest";
import request from "supertest";

const PORT = process.env.PORT || 5000;
const URL = `http://0.0.0.0:${PORT}`;

test("should return status code 200, 'pointless test'", async () => {
  const res = await request(URL).get("/api/");
  expect(res.statusCode).toBe(200);
});

describe("USERS SUITE", () => {
  describe("/:id SUITE", () => {
    test("should get user with id 1 and return status code 200", async () => {
      const res = await request(URL).get("/api/v1/users/1");
      expect(res.statusCode).toBe(200);
    });

    test("should send a bad request to get user and return status code 400", async () => {
      const res = await request(URL).get("/api/v1/users/Richard_Nixson");
      expect(res.statusCode).toBe(400);
    });

    test("should get user that doesn't exist and return status code 404", async () => {
      const res = await request(URL).get("/api/v1/users/1000000");
      expect(res.statusCode).toBe(404);
    });
  });

  describe("/stats SUITE", () => {
    test("should get stats for user with id 1 and return status code 200", async () => {
      const res = await request(URL).get("/api/v1/users/stats").send({ id: 3 });
      expect(res.statusCode).toBe(200);
    });

    test("should try to get stats for user that doesn't exist and return status code 404", async () => {
      const res = await request(URL)
        .get("/api/v1/users/stats")
        .send({ id: 1000000 });
      expect(res.statusCode).toBe(404);
    });
  });

  describe("/bio SUITE", () => {
    test("should update bio of user with id 1 and return status code 200", async () => {
      const res = await request(URL)
        .put("/api/v1/users/bio")
        .send({ id: 1, bio: "This is the best bio" });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update bio user that doesn't exist", async () => {
      const res = await request(URL)
        .put("/api/v1/users/bio")
        .send({ id: 1000000, bio: "This is the best bio" });
      expect(res.statusCode).toBe(404);
    });
  });

  describe("/profilepicture SUITE", () => {
    test("should update profilepicture of user with id 1 and return status code 200", async () => {
      const res = await request(URL)
        .put("/api/v1/users/profilepicture")
        .send({ id: 1, profilepicture: "catpicture.png" });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update profilepicture user that doesn't exist", async () => {
      const res = await request(URL)
        .put("/api/v1/users/profilepicture")
        .send({ id: 1000000, profilepicture: "catpicture.png" });
      expect(res.statusCode).toBe(404);
    });
  });

  describe("/username SUITE", () => {
    test("should update username of user with id 1 and return status code 200", async () => {
      const res = await request(URL)
        .put("/api/v1/users/username")
        .send({ id: 1, username: "This is the best username" });
      expect(res.statusCode).toBe(201);
    });

    test("should try to update username user that doesn't exist", async () => {
      const res = await request(URL)
        .put("/api/v1/users/username")
        .send({ id: 1000000, username: "This is the best username" });
      expect(res.statusCode).toBe(404);
    });
  });
});

describe("CHALLENGES SUITE", () => {
  test("should get todays challenge and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/challenges/today");
    expect(res.statusCode).toBe(200);
  });

  test("should use an invalid challenge id and return status code 400", async () => {
    const res = await request(URL).get("/api/v1/challenges/today/");
    expect(res.statusCode).toBe(400);
  });
});

describe("COMPLETIONS SUITE", () => {
  test("should get all completions and return status code 200", async () =>{
    const res = await request(URL).get("/api/v1/completions");
    expect(res.statusCode).toBe(200);
  });
  
  test("should get from /unauth_stats and return status code 200", async () =>{
    const res = await request(URL).get("/api/v1/completions/unauth_stats");
    expect(res.statusCode).toBe(200);
  })

  test("should get the stats for user with id 1 and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/stats").send({ id: 1 });
    expect(res.statusCode).toBe(200);
  })

  test("should try to get stats from user that doesn't exist and return status code 404", async () => {
    const res = await request(URL).get("/api/v1/completions/stats").send({ id: 1000000 });
    expect(res.statusCode).toBe(404);
  })

  test("should get calendar for user with id of 1 and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/calendar").send({ id: 1 });
    expect(res.statusCode).toBe(200);
  })

  test("should try to get calendar of user that doesn't exist and return status code of 404", async () =>{
    const res = await request(URL).get("/api/v1/completions/calendar").send({id:100000});
    expect(res.statusCode).toBe(404);
  })

  test("should try to get current daily challenge data from user with id of 1 and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/today").send({ id: 1 });
    expect(res.statusCode).toBe(200);
  });

  test("should try to get current daily challenge data from user that doesn't exist and return status code 404", async () => {
    const res = await request(URL).get("/api/v1/completions/today").send({ id: 1000000 });
    expect(res.statusCode).toBe(404);
  });

  test("should get all completions of the day and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/all_today");
    expect(res.statusCode).toBe(200);
  });

  test("should get current daily completion from user with id of 1 and return status code 200", async () => {
    const res = await request(URL).get("/api/v1/completions/1");
    expect(res.statusCode).toBe(200);
  });

  test("should try to get current daily completion from user that doesn't exist and return status code 404", async () => {
    const res = await request(URL).get("/api/v1/completions/1000000");
    expect(res.statusCode).toBe(404);
  });

  test("should send a bad get request and return status code 400", async () => {
    const res = await request(URL).get("/api/v1/completions/Richard_Nixson");
    expect(res.statusCode).toBe(400);
  
  });

  test("should post new completion for user with id of 4", async () => {
    const res = await request(URL).post("/api/v1/completions/").send({ id: 4, description: "I hate you" });
    expect(res.statusCode).toBe(200);
  })

  test("should post new completion for user who already made a completion and return status code 302", async () => {
    const res = await request(URL).post("/api/v1/completions/").send({ id: 2});
    expect(res.statusCode).toBe(302);
  });

  test("should try to post a new completion for a user who doesn't exist and return status code 404", async () => {
    const res = await request(URL).post("/api/v1/completions/").send({ id: 1000000 });
    expect(res.statusCode).toBe(404);
  });

  test("should try to delete post made by user with id of 1 and return status code 204", async () => {
    const res = await request(URL).delete("/api/v1/completions/").send({ id: 1 });
    expect(res.statusCode).toBe(204);
  });

  test("should try to delete completion made by used who doesn't exist and return status code 404", async () => {
    const res = await request(URL).delete("/api/v1/completions/").send({ id: 1000000 });
    expect(res.statusCode).toBe(404); 
  });

  test("should send a bad delete request and return status code 400", async () => {
    const res = await request(URL).delete("/api/v1/completions/Richard_Nixson");
    expect(res.statusCode).toBe(400);
  })
});
