defmodule WhackathonPlatformWeb.LiveHelpers do
  @moduledoc false
  import Phoenix.LiveView

  alias Pow.Store.CredentialsCache
  alias WhackathonPlatformWeb.Routes
  alias WhackathonPlatformWeb.Router.Helpers, as: Routes

  def assign_defaults(socket, session) do
    socket = assign_new(socket, :current_user, fn -> get_user(socket, session) end)

    if socket.assigns.current_user do
      socket
    else
      redirect(socket, to: Routes.page_path(%Plug.Conn{}, :index))
    end
  end

  defp get_user(socket, session, config \\ [otp_app: :tasklist])

  defp get_user(socket, %{"my_app_auth" => signed_token}, config) do
    conn = struct!(Plug.Conn, secret_key_base: socket.endpoint.config(:secret_key_base))
    salt = Atom.to_string(Pow.Plug.Session)

    with {:ok, token} <- Pow.Plug.verify_token(conn, salt, signed_token, config),
         # Use Pow.Store.Backend.EtsCache if you haven't configured Mnesia yet.
         {user, _metadata} <-
           CredentialsCache.get([backend: Pow.Store.Backend.MnesiaCache], token) do
      user
    else
      _any -> nil
    end
  end

  defp get_user(_, _, _), do: nil
end
