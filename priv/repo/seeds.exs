# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WhackathonPlatform.Repo.insert!(%WhackathonPlatform.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias WhackathonPlatform.Repo
alias WhackathonPlatform.Users.User
alias WhackathonPlatform.Event
alias WhackathonPlatform.Project


# Setting up some test users. One admin
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "anton", email: "testadmin@gmail.com", admin: true, bio: "Min första bio var lejonkungen"})
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "Testiluring", email: "derp@gmail.com", admin: false, bio: "Min första bio var Derpkungen"})
Repo.insert!(%User{
  password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"),
  password: "12345678",
  username: "Testiluring2",
  email: "derp2@gmail.com",
  admin: false,
  bio: """
  Min första bio var Derpkungen och den var så jävla bra så jag skulle kunna smälla av.
  Be fucking impossible to ignore. Stand so tall that they can’t look past you. When you design, you have to draw on your own fucking life
  experiences. If it’s not something you would want to read/look at/use then why fucking bother? Remember it’s called the creative process, it’s not the
  creative fucking moment. Nothing of value comes to you without fucking working at it. The details are not the details. They make the fucking design.
  You won’t get good at anything by doing it a lot fucking aimlessly. While having drinks with Tibor Kalman one night, he told me, “When you make something
  no one hates, no one fucking loves it.” Design is all about fucking relationships—the relationship of form and content, the relationship of elements, the
  relationship of designer and user. You need to sit down and sketch more fucking ideas because stalking your ex on facebook isn’t going to get you anywhere.
  Intuition is fucking important. You are not your fucking work. Don’t fucking censor yourself. Sterility leads to susceptibility. If you fucking give up, you
  will achieve nothing. Why are you reading all of this? Get back to work. Don’t get hung up on things that don’t fucking work. Dedicate yourself to lifelong
  fucking learning. Paul Rand once said, “The public is more familiar with bad fucking design than good design. It is, in effect, conditioned to prefer bad
  design, because that is what it lives with. The new becomes threatening, the old reassuring.” Never.
  """
  })

# Set up some test events
Repo.insert!(%Event{
  name: "Sommarhacket",
  theme: "Hawaii",
  description: """
  Knacka kod. Be fucking impossible to ignore. Stand so tall that they can’t look past you. When you design, you have to draw on your own fucking life
  experiences. If it’s not something you would want to read/look at/use then why fucking bother? Remember it’s called the creative process, it’s not the
  creative fucking moment. Nothing of value comes to you without fucking working at it. The details are not the details. They make the fucking design.
  You won’t get good at anything by doing it a lot fucking aimlessly. While having drinks with Tibor Kalman one night, he told me, “When you make something
  no one hates, no one fucking loves it.” Design is all about fucking relationships—the relationship of form and content, the relationship of elements, the
  relationship of designer and user. You need to sit down and sketch more fucking ideas because stalking your ex on facebook isn’t going to get you anywhere.
  Intuition is fucking important. You are not your fucking work. Don’t fucking censor yourself. Sterility leads to susceptibility. If you fucking give up, you
  will achieve nothing. Why are you reading all of this? Get back to work. Don’t get hung up on things that don’t fucking work. Dedicate yourself to lifelong
  fucking learning. Paul Rand once said, “The public is more familiar with bad fucking design than good design. It is, in effect, conditioned to prefer bad
  design, because that is what it lives with. The new becomes threatening, the old reassuring.” Never.
  """,
  start_time: DateTime.new!(~D[2021-07-16], ~T[16:00:00], "Etc/UTC"),
  end_time: DateTime.new!(~D[2021-07-17], ~T[16:00:00], "Etc/UTC")})

Repo.insert!(%Event{
  name: "Julknacket",
  theme: "Tommy Körberg",
  description: """
  Gläns över sjö och strand. Be fucking impossible to ignore. Stand so tall that they can’t look past you. When you design, you have to draw on your own
  fucking life experiences. If it’s not something you would want to read/look at/use then why fucking bother? Remember it’s called the creative process,
  it’s not the creative fucking moment. Nothing of value comes to you without fucking working at it. The details are not the details. They make the fucking
  design. You won’t get good at anything by doing it a lot fucking aimlessly. While having drinks with Tibor Kalman one night, he told me, “When you make
  something no one hates, no one fucking loves it.” Design is all about fucking relationships—the relationship of form and content, the relationship of elements,
  the relationship of designer and user. You need to sit down and sketch more fucking ideas because stalking your ex on facebook isn’t going to get you anywhere.
  Intuition is fucking important. You are not your fucking work. Don’t fucking censor yourself. Sterility leads to susceptibility. If you fucking give up, you
  will achieve nothing. Why are you reading all of this? Get back to work. Don’t get hung up on things that don’t fucking work. Dedicate yourself to lifelong
  fucking learning. Paul Rand once said, “The public is more familiar with bad fucking design than good design. It is, in effect, conditioned to prefer bad
  design, because that is what it lives with. The new becomes threatening, the old reassuring.” Never.
  Gläns över sjö och strand. Be fucking impossible to ignore. Stand so tall that they can’t look past you. When you design, you have to draw on your own
  fucking life experiences. If it’s not something you would want to read/look at/use then why fucking bother? Remember it’s called the creative process,
  it’s not the creative fucking moment. Nothing of value comes to you without fucking working at it. The details are not the details. They make the fucking
  design. You won’t get good at anything by doing it a lot fucking aimlessly. While having drinks with Tibor Kalman one night, he told me, “When you make
  something no one hates, no one fucking loves it.” Design is all about fucking relationships—the relationship of form and content, the relationship of elements,
  the relationship of designer and user. You need to sit down and sketch more fucking ideas because stalking your ex on facebook isn’t going to get you anywhere.
  Intuition is fucking important. You are not your fucking work. Don’t fucking censor yourself. Sterility leads to susceptibility. If you fucking give up, you
  will achieve nothing. Why are you reading all of this? Get back to work. Don’t get hung up on things that don’t fucking work. Dedicate yourself to lifelong
  fucking learning. Paul Rand once said, “The public is more familiar with bad fucking design than good design. It is, in effect, conditioned to prefer bad
  design, because that is what it lives with. The new becomes threatening, the old reassuring.” Never.
  """,
  start_time: DateTime.new!(~D[2021-12-22], ~T[16:00:00], "Etc/UTC"),
  end_time: DateTime.new!(~D[2021-12-23], ~T[16:00:00], "Etc/UTC")})

Repo.insert!(%Event{
  name: "Halloweensmacket",
  theme: "Pumpa läns",
  description: "Ordvitsar i halloweentider",
  start_time: DateTime.new!(~D[2021-10-30], ~T[16:00:00], "Etc/UTC"),
  end_time: DateTime.new!(~D[2021-10-31], ~T[16:00:00], "Etc/UTC")})

Repo.insert!(%Event{
  name: "Telefonjacket",
  theme: "Erlang",
  description: "Det fantastiska språket som möjliggjorde denna sida",
  start_time: DateTime.new!(~D[2021-09-17], ~T[16:00:00], "Etc/UTC"),
  end_time: DateTime.new!(~D[2021-09-18], ~T[16:00:00], "Etc/UTC")})

Repo.insert!(%Project{
  title: "Is this your card generator",
  description: "Generates a card for you to decide if it was your card or not"
})

Repo.insert!(%Project{
  title: "RNG Dice",
  description: "Truly fair randomly generated dice rolls. Supports all common types of dice"
})

Repo.insert!(%Project{
  title: "Game Boy emulator",
  description: "Play all your favorite childhood games with this optimized, high performance beast of an emulator."
})
