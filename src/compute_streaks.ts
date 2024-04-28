import { Challenge, Completion } from "@prisma/client";

export function compute_streak(
  completions: Completion[],
  challenges: Challenge[]
) {
  let count = 0;

  challenges = challenges.filter((challenge) => {
    return challenge.date <= new Date();
  });

  const streak_mapping = challenges.map((challenge) => {
    const completion = completions.find((predicate) => {
      return predicate.challenge_id === challenge.id;
    });
    return completion !== undefined;
  });

  if (!streak_mapping[0]) {
    streak_mapping[0] = true;
  } else {
    count += 1;
  }
  count += streak_mapping.indexOf(false) - 1;

  if (count < 0) count = 0;

  return count;
}
