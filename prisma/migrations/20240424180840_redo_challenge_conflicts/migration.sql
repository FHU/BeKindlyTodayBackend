/*
  Warnings:

  - A unique constraint covering the columns `[twist]` on the table `challenges` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "challenges_prompt_key";

-- CreateIndex
CREATE UNIQUE INDEX "challenges_twist_key" ON "challenges"("twist");
