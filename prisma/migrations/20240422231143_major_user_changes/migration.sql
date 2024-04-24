/*
  Warnings:

  - You are about to drop the column `email` on the `users` table. All the data in the column will be lost.
  - Made the column `kinde_id` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "users_email_key";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "email",
ALTER COLUMN "username" DROP NOT NULL,
ALTER COLUMN "kinde_id" SET NOT NULL;
