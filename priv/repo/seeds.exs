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


# Setting up some test users. One admin
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "anton", email: "testadmin@gmail.com", admin: true, bio: "Min första bio var lejonkungen"})
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "Testiluring", email: "derp@gmail.com", admin: false, bio: "Min första bio var Derpkungen"})

# Set up some test events
Repo.insert!(%Event{name: "Sommarhacket", theme: "Hawaii", description: "Knacka kod", start_time: DateTime.new!(~D[2021-07-16], ~T[16:00:00], "Etc/UTC"), end_time: DateTime.new!(~D[2021-07-17], ~T[16:00:00], "Etc/UTC")})
Repo.insert!(%Event{name: "Julknacket", theme: "Tommy Körberg", description: "Gläns över sjö och strand", start_time: DateTime.new!(~D[2021-12-22], ~T[16:00:00], "Etc/UTC"), end_time: DateTime.new!(~D[2021-12-23], ~T[16:00:00], "Etc/UTC")})
Repo.insert!(%Event{name: "Halloweensmacket", theme: "Pumpa läns", description: "Ordvitsar i halloweentider", start_time: DateTime.new!(~D[2021-10-30], ~T[16:00:00], "Etc/UTC"), end_time: DateTime.new!(~D[2021-10-31], ~T[16:00:00], "Etc/UTC")})
Repo.insert!(%Event{name: "Telefonjacket", theme: "Erlang", description: "Det fantastiska språket som möjliggjorde denna sida", start_time: DateTime.new!(~D[2021-09-17], ~T[16:00:00], "Etc/UTC"), end_time: DateTime.new!(~D[2021-09-18], ~T[16:00:00], "Etc/UTC")})
