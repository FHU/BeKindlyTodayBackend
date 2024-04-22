import { KindeRequest } from '../interfaces/KindeRequest';
import { Response, NextFunction } from 'express';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const getUser = async (
  req: KindeRequest,
  res: Response,
  next: NextFunction
) => {
  let user = await prisma.user.findUnique({
    where: {
      kindeId: req.user.id,
    },
  });

  if (user === null) {
    user = await prisma.user.create({
      data: {
        kindeId: req.user.id,
      },
    });
  }

  req.body.user_id = user.id;

  next();
};

export default { getUser };
