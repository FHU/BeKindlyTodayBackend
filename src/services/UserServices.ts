import { KindeRequest } from '../interfaces/KindeRequest';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

//We are using such an unholy mix of things meant for JS and things meant for TS
//I will accept one use of any if you do.
const getUser = async (req: KindeRequest | any) => {
  if (req.user === undefined) {
    return notKindeLookup(req.body.id);
  }

  let user = await prisma.user.findUnique({
    where: {
      kindeId: req.user.id,
    },
    select: {
      id: true,
      username: true,
      bio: true,
      profilePicture: true,
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
  if (!id) return null;
  return await prisma.user.findUnique({
    where: { id },
    select: {
      id: true,
      username: true,
      bio: true,
      profilePicture: true,
    },
  });
};

export default getUser;
