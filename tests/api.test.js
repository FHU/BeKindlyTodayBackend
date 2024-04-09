import { describe } from 'node:test';
import {test, expect, request} from 'vitest';
import request from "supertest";

const URL = "https://app.swaggerhub.com/apis/GREENE8616/BeKindly/1.0.0#/"

describe('USERS table tests', () =>{
    
    test('GET from /challenges/today ', async () => {
        const res = await request(URL).get('/challenges/today');
        expect(res.statusCode).toBe(200);    
    });

    test('GET from /completions', async () => {
        const res = await request(URL).get('/completions');
        expect(res.statusCode).toBe(200);
    });

    test('GET from /users/memories', async () =>{
        const res = await request(URL).get('/users/memories');
        expect(res.statusCode).toBe(200);
    });

    test('GET from /completions/count', async () => {
        const res = await request(URL).get('/api/v1/completed');
        expect(res.statusCode).toBe(200);
    });
});

describe('DEVELOPERS table tests', () =>{

    test('GET Challenges with ID 1', async () => {
        const res = await request(URL).get('/challenges/1');
        expect(res.statusCode).toBe(200);    
    });

})

