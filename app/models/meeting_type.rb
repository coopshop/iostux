class MeetingType < ApplicationRecord
  enum name: {
         coachee_pass: 'coachee_pass',
         consultation: 'consultation',
         individual_coaching: 'individual_coaching',
         rank_evaluation: 'rank_evaluation',
         team_coaching: 'team_coaching'
       }
end
