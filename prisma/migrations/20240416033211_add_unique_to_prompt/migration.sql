/*
  Warnings:

  - A unique constraint covering the columns `[prompt]` on the table `challenges` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "challenges_prompt_key" ON "challenges"("prompt");
