defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias DiscussWeb.Models.User

  def callback(%{assigns: ${ueberauth_auth: auth}} = conn, params) do

  end
end
