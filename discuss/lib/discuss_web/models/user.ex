defmodule DiscussWeb.Models.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, DiscussWeb.Models.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:email, :provider, :token])
    |> Ecto.Changeset.validate_required([:email, :provider, :token])
  end
end
