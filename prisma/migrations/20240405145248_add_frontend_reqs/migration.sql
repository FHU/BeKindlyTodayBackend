/*
  Warnings:

  - A unique constraint covering the columns `[date]` on the table `challenges` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "user_feedback" (
    "id" SERIAL NOT NULL,
    "feedback_text" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "challenge_id" INTEGER NOT NULL,

    CONSTRAINT "user_feedback_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_feedback_id_key" ON "user_feedback"("id");

-- CreateIndex
CREATE UNIQUE INDEX "user_feedback_user_id_challenge_id_key" ON "user_feedback"("user_id", "challenge_id");

-- CreateIndex
CREATE UNIQUE INDEX "challenges_date_key" ON "challenges"("date");

-- CreateIndex
CREATE INDEX "challenges_date_idx" ON "challenges"("date");

-- AddForeignKey
ALTER TABLE "user_feedback" ADD CONSTRAINT "user_feedback_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_feedback" ADD CONSTRAINT "user_feedback_challenge_id_fkey" FOREIGN KEY ("challenge_id") REFERENCES "challenges"("id") ON DELETE CASCADE ON UPDATE CASCADE;
