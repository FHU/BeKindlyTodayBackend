-- AlterTable
ALTER TABLE "completions" ADD COLUMN     "completed_twist" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "bio" TEXT;
