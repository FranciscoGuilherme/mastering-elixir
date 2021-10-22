defmodule DiscussWeb.Models.Topic do
  use Ecto.Schema

  schema "topics" do
    field :title, :string
    belongs_to :user, DiscussWeb.Models.User

    timestamps([type: :utc_datetime_usec])
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:title, :user_id])
    |> Ecto.Changeset.validate_required([:title, :user_id])
  end
end
