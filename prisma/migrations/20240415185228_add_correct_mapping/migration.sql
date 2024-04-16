/*
  Warnings:

  - You are about to drop the `challenge` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `completion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "completion" DROP CONSTRAINT "completion_challenge_id_fkey";

-- DropForeignKey
ALTER TABLE "completion" DROP CONSTRAINT "completion_user_id_fkey";

-- DropTable
DROP TABLE "challenge";

-- DropTable
DROP TABLE "completion";

-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "challenges" (
    "id" SERIAL NOT NULL,
    "prompt" TEXT NOT NULL,
    "suggestion" TEXT NOT NULL,
    "twist" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "source" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "challenges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "completions" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" INTEGER NOT NULL,
    "challenge_id" INTEGER NOT NULL,

    CONSTRAINT "completions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_id_key" ON "users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "challenges_id_key" ON "challenges"("id");

-- CreateIndex
CREATE UNIQUE INDEX "challenges_date_key" ON "challenges"("date");

-- CreateIndex
CREATE INDEX "challenges_date_idx" ON "challenges"("date");

-- CreateIndex
CREATE UNIQUE INDEX "completions_id_key" ON "completions"("id");

-- CreateIndex
CREATE INDEX "completions_date_idx" ON "completions"("date");

-- CreateIndex
CREATE UNIQUE INDEX "completions_user_id_challenge_id_key" ON "completions"("user_id", "challenge_id");

-- AddForeignKey
ALTER TABLE "completions" ADD CONSTRAINT "completions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "completions" ADD CONSTRAINT "completions_challenge_id_fkey" FOREIGN KEY ("challenge_id") REFERENCES "challenges"("id") ON DELETE CASCADE ON UPDATE CASCADE;
