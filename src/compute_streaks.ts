import { Completion } from '@prisma/client';

export function compute_streak(completions: Completion[]) {
  if (completions.length === 0) return 0;

  const completionDates = completions.map(
    (completion) =>
      new Date(new Date(completion.date).setHours(0, 0, 0, 0)).getTime() //This is done to not edit original completions array
  );

  completionDates.sort();

  const DAY_IN_MS = 86400000;
  const TODAY = new Date(new Date().setHours(0, 0, 0, 0)).getTime();
  const YESTERDAY = new Date(TODAY - DAY_IN_MS).getTime();

  let curr = completionDates.length - 1;

  /**nextStreakDate is meant to be the next day that would exist if you did have a streak
   * nextCompletionDate is the next day in your completions.
   * The idea is to move through the completions and anywhere there isnt another completion in sequence
   * the streak number would be returned.
   */
  let nextStreakDate = new Date(completionDates[curr] - DAY_IN_MS).getTime();

  if (completionDates[curr] !== TODAY && completionDates[curr] !== YESTERDAY)
    return 0;

  let streak = 1;
  //While the next day in the array of completions == next day if there was a streak
  while (completionDates[curr - 1] == nextStreakDate) {
    streak++;
    curr--;

    nextStreakDate = new Date(completionDates[curr] - DAY_IN_MS).getTime();

    if (completionDates[curr - 1] === undefined) break;
  }

  return streak;
}
