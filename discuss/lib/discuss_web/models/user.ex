defmodule DiscussWeb.Models.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:email, :provider, :token])
    |> Ecto.Changeset.validate_required([:email, :provider, :token])
  end
end
