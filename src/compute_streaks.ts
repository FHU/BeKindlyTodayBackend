import { Completion } from '@prisma/client';

export function compute_streak(completions: Completion[]) {
  if (completions.length === 0) return 0;

  let streak = 1;

  const completionDates = completions.map(
    (completion) => new Date(new Date(completion.date).setHours(0, 0, 0, 0)) //This is done to not edit original completions array
  );

  const DAY_IN_MS = 86400000;
  const TODAY = new Date(new Date().setHours(0, 0, 0, 0));
  const YESTERDAY = new Date(TODAY.getTime() - DAY_IN_MS);

  let curr = completionDates.length - 1;

  //This only will run in testing since there should be no way to have a completion date
  //past the current date in production
  while (completionDates[curr] > TODAY) {
    curr--;
  }

  /**nextStreakDate is meant to be the next day that would exist if you did have a streak
   * nextCompletionDate is the next day in your completions.
   * The idea is to move through the completions and anywhere there isnt another completion in sequence
   * the streak number would be returned.
   */
  let nextStreakDate = new Date(completionDates[curr].getTime() - DAY_IN_MS);
  let nextCompletionDate = completionDates[curr - 1];

  if (
    completionDates[curr].getTime() !== TODAY.getTime() &&
    completionDates[curr].getTime() !== YESTERDAY.getTime()
  )
    return 0;

  //While the next day in the array of completions == next day if there was a streak
  while (nextCompletionDate.getTime() == nextStreakDate.getTime()) {
    streak++;
    curr--;

    nextStreakDate = new Date(completionDates[curr].getTime() - DAY_IN_MS);
    nextCompletionDate = completionDates[curr - 1];

    if (nextCompletionDate === undefined) break;
  }

  return streak;
}
