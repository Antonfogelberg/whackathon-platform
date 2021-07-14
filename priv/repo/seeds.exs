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


# Setting up some test users. One admin
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "anton", email: "testadmin@gmail.com", admin: true, bio: "Min första bio var lejonkungen"})
Repo.insert!(%User{password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("12345678"), password: "12345678", username: "Testiluring", email: "derp@gmail.com", admin: false, bio: "Min första bio var Derpkungen"})
