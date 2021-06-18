defmodule WhackathonPlatformWeb.PowResetPassword.MailerView do
  use WhackathonPlatformWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
