/*
  Warnings:

  - You are about to drop the `challenge_completions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `challenges` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `comment_reports` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `comments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `completion_reports` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `completions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `report_creators` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `reports` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_completions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_feedback` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "challenge_completions" DROP CONSTRAINT "challenge_completions_challenge_id_fkey";

-- DropForeignKey
ALTER TABLE "challenge_completions" DROP CONSTRAINT "challenge_completions_completion_id_fkey";

-- DropForeignKey
ALTER TABLE "comment_reports" DROP CONSTRAINT "comment_reports_comment_id_fkey";

-- DropForeignKey
ALTER TABLE "comment_reports" DROP CONSTRAINT "comment_reports_report_id_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_completion_id_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_user_id_fkey";

-- DropForeignKey
ALTER TABLE "completion_reports" DROP CONSTRAINT "completion_reports_completion_id_fkey";

-- DropForeignKey
ALTER TABLE "completion_reports" DROP CONSTRAINT "completion_reports_report_id_fkey";

-- DropForeignKey
ALTER TABLE "report_creators" DROP CONSTRAINT "report_creators_report_id_fkey";

-- DropForeignKey
ALTER TABLE "report_creators" DROP CONSTRAINT "report_creators_user_id_fkey";

-- DropForeignKey
ALTER TABLE "user_completions" DROP CONSTRAINT "user_completions_completion_id_fkey";

-- DropForeignKey
ALTER TABLE "user_completions" DROP CONSTRAINT "user_completions_user_id_fkey";

-- DropForeignKey
ALTER TABLE "user_feedback" DROP CONSTRAINT "user_feedback_challenge_id_fkey";

-- DropForeignKey
ALTER TABLE "user_feedback" DROP CONSTRAINT "user_feedback_user_id_fkey";

-- DropTable
DROP TABLE "challenge_completions";

-- DropTable
DROP TABLE "challenges";

-- DropTable
DROP TABLE "comment_reports";

-- DropTable
DROP TABLE "comments";

-- DropTable
DROP TABLE "completion_reports";

-- DropTable
DROP TABLE "completions";

-- DropTable
DROP TABLE "report_creators";

-- DropTable
DROP TABLE "reports";

-- DropTable
DROP TABLE "user_completions";

-- DropTable
DROP TABLE "user_feedback";

-- DropTable
DROP TABLE "users";

-- DropEnum
DROP TYPE "report_type";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Challenge" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "source" TEXT NOT NULL,

    CONSTRAINT "Challenge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Completion" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" INTEGER NOT NULL,
    "challenge_id" INTEGER NOT NULL,

    CONSTRAINT "Completion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Challenge_id_key" ON "Challenge"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Challenge_date_key" ON "Challenge"("date");

-- CreateIndex
CREATE INDEX "Challenge_date_idx" ON "Challenge"("date");

-- CreateIndex
CREATE UNIQUE INDEX "Completion_id_key" ON "Completion"("id");

-- CreateIndex
CREATE INDEX "Completion_date_idx" ON "Completion"("date");

-- CreateIndex
CREATE UNIQUE INDEX "Completion_user_id_challenge_id_key" ON "Completion"("user_id", "challenge_id");

-- AddForeignKey
ALTER TABLE "Completion" ADD CONSTRAINT "Completion_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Completion" ADD CONSTRAINT "Completion_challenge_id_fkey" FOREIGN KEY ("challenge_id") REFERENCES "Challenge"("id") ON DELETE CASCADE ON UPDATE CASCADE;
