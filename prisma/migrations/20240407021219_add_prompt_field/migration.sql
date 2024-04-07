/*
  Warnings:

  - You are about to drop the column `description` on the `Challenge` table. All the data in the column will be lost.
  - Added the required column `prompt` to the `Challenge` table without a default value. This is not possible if the table is not empty.
  - Added the required column `suggestion` to the `Challenge` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Challenge" DROP COLUMN "description",
ADD COLUMN     "prompt" TEXT NOT NULL,
ADD COLUMN     "suggestion" TEXT NOT NULL;
