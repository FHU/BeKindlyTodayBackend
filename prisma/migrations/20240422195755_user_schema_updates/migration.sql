/*
  Warnings:

  - You are about to drop the column `password` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[kinde_id]` on the table `users` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "users" DROP COLUMN "password",
ADD COLUMN     "kinde_id" TEXT,
ADD COLUMN     "profile_picture" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "users_kinde_id_key" ON "users"("kinde_id");

-- CreateIndex
CREATE INDEX "users_kinde_id_idx" ON "users"("kinde_id");
