import internal from 'stream';
import { KindeRequest } from '../interfaces/KindeRequest';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

//We are using such an unholy mix of things meant for JS and things meant for TS
//I will accept one use of any if you do.
const getUser = async (req: KindeRequest | any) => {
  if (req.user === null) {
    return notKindeLookup(req.body.id);
  }

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

  return user;
};

const notKindeLookup = async (id: number) => {
  return await prisma.user.findUnique({ where: { id } });
};

export default getUser;
