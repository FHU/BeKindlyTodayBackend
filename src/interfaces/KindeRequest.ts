import { Request } from 'express';

interface KindeUser {
  id: string;
}

export interface KindeRequest extends Request {
  user: KindeUser;
}
