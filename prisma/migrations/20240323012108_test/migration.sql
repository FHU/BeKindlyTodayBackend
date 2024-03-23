-- CreateEnum
CREATE TYPE "report_type" AS ENUM ('Discrimination', 'Harassment', 'SexualContent', 'Violence', 'Scam', 'Impersonation', 'Abuse', 'SelfHarm', 'PrivacyViolation');

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
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "source" TEXT NOT NULL,

    CONSTRAINT "challenges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "completions" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "completions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comments" (
    "id" SERIAL NOT NULL,
    "body" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" INTEGER NOT NULL,
    "completion_id" INTEGER NOT NULL,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reports" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "type" "report_type" NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_completions" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "completion_id" INTEGER NOT NULL,

    CONSTRAINT "user_completions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "challenge_completions" (
    "id" SERIAL NOT NULL,
    "challenge_id" INTEGER NOT NULL,
    "completion_id" INTEGER NOT NULL,

    CONSTRAINT "challenge_completions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comment_reports" (
    "id" SERIAL NOT NULL,
    "comment_id" INTEGER NOT NULL,
    "report_id" INTEGER NOT NULL,

    CONSTRAINT "comment_reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_creators" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "report_id" INTEGER NOT NULL,

    CONSTRAINT "report_creators_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "completion_reports" (
    "id" SERIAL NOT NULL,
    "completion_id" INTEGER NOT NULL,
    "report_id" INTEGER NOT NULL,

    CONSTRAINT "completion_reports_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_id_key" ON "users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "challenges_id_key" ON "challenges"("id");

-- CreateIndex
CREATE UNIQUE INDEX "completions_id_key" ON "completions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "comments_id_key" ON "comments"("id");

-- CreateIndex
CREATE UNIQUE INDEX "reports_id_key" ON "reports"("id");

-- CreateIndex
CREATE UNIQUE INDEX "user_completions_id_key" ON "user_completions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "user_completions_user_id_completion_id_key" ON "user_completions"("user_id", "completion_id");

-- CreateIndex
CREATE UNIQUE INDEX "challenge_completions_id_key" ON "challenge_completions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "challenge_completions_challenge_id_completion_id_key" ON "challenge_completions"("challenge_id", "completion_id");

-- CreateIndex
CREATE UNIQUE INDEX "comment_reports_id_key" ON "comment_reports"("id");

-- CreateIndex
CREATE UNIQUE INDEX "comment_reports_comment_id_report_id_key" ON "comment_reports"("comment_id", "report_id");

-- CreateIndex
CREATE UNIQUE INDEX "report_creators_id_key" ON "report_creators"("id");

-- CreateIndex
CREATE UNIQUE INDEX "report_creators_user_id_report_id_key" ON "report_creators"("user_id", "report_id");

-- CreateIndex
CREATE UNIQUE INDEX "completion_reports_id_key" ON "completion_reports"("id");

-- CreateIndex
CREATE UNIQUE INDEX "completion_reports_completion_id_report_id_key" ON "completion_reports"("completion_id", "report_id");

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_completion_id_fkey" FOREIGN KEY ("completion_id") REFERENCES "completions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_completions" ADD CONSTRAINT "user_completions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_completions" ADD CONSTRAINT "user_completions_completion_id_fkey" FOREIGN KEY ("completion_id") REFERENCES "completions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "challenge_completions" ADD CONSTRAINT "challenge_completions_challenge_id_fkey" FOREIGN KEY ("challenge_id") REFERENCES "challenges"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "challenge_completions" ADD CONSTRAINT "challenge_completions_completion_id_fkey" FOREIGN KEY ("completion_id") REFERENCES "completions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comment_reports" ADD CONSTRAINT "comment_reports_comment_id_fkey" FOREIGN KEY ("comment_id") REFERENCES "comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comment_reports" ADD CONSTRAINT "comment_reports_report_id_fkey" FOREIGN KEY ("report_id") REFERENCES "reports"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "report_creators" ADD CONSTRAINT "report_creators_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "report_creators" ADD CONSTRAINT "report_creators_report_id_fkey" FOREIGN KEY ("report_id") REFERENCES "reports"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "completion_reports" ADD CONSTRAINT "completion_reports_completion_id_fkey" FOREIGN KEY ("completion_id") REFERENCES "completions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "completion_reports" ADD CONSTRAINT "completion_reports_report_id_fkey" FOREIGN KEY ("report_id") REFERENCES "reports"("id") ON DELETE CASCADE ON UPDATE CASCADE;
