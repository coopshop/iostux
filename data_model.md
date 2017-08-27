# Primitives

All tables have `id serial (primary key)`, `created_at timestamptz` and
`updated_at timestamptz` unless otherwise noted.

- Authorization
  - Represents a user telling the authentication provider (e.g. Discord) to
    give us access to their data.
  - Fields:
    ```
    provider varchar (non-null) (default 'discord'),
    user_id integer (non-null) (foreign key user.id),
    uid varchar (non-null)
    ```
- Meeting
  - Represents an instructional session of some kind.
  - Fields:
    ```
    start_time timestamptz,
    end_time timestamptz,
    completed boolean,
    coachee integer (foreign key user.id) (index),
    coach integer (foreign key user.id) (index),
    notes varchar,
    meeting_type integer (foreign key meeting_type.id) (index),
    ```
- MeetingType
  - Enumeration of meeting types & prices
  - Fields:
    ```
    name enum(
      'Coachee Pass',
      'Coaching Session',
      'Rank Evaluation',
      'Consultation',
      'Team coaching'
    ) (index),
    price numeric(2)
    ```
- Notification
- Referral
- Review
- User
  - Fields:
    ```
    name varchar,
    email varchar (unique) (non-null) (default '')
    ```

# Derivatives

- Refund
  - User + Order
