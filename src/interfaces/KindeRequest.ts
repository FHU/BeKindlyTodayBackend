import { Request } from "express";

interface KindeUser {
  id: string;
  first_name: string;
  last_name: string;
}

export interface KindeRequest extends Request {
  user: KindeUser;
}
