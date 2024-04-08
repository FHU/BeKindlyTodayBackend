import { describe } from 'node:test';
import {test, expect, request} from 'vitest';
import request from "supertest";

const URL = "http://virtserver.swaggerhub.com/sean.janiec/BeKindly/1.0.0"

describe('CHALLENGES', () =>{
    
    test('GET Challenges', async () => {
        const res = await request(URL).get('/api/v1/challenge');
        expect(res.statusCode).toBe(200);    
    });

    test('GET completions', async () => {
        const res = await request(URL).get('/api/v1/completion');
        expect(res.statusCode).toBe(200);
    });

    //FIX END POINT
    // test('GET completions for today', async () => {
    //     const res = await request(URL).get('/api/v1/completion/today');
    //     expect(res.statusCode).toBe(200);
    // });

    test('GET completions for user', async () => {
        const res = await request(URL).get('/api/v1/completed');
        expect(res.statusCode).toBe(200);
    });
});

describe('GET User Info', () =>{

    test('GET Users', async () => {
        const res = await request(URL).get('/api/v1/user');
        expect(res.statusCode).toBe(200);    
    });

    test('GET User Memories', async () => {
        const res = await request(URL).get('/api/v1/user/memories');
        expect(res.statusCode).toBe(200);    
    });

})

