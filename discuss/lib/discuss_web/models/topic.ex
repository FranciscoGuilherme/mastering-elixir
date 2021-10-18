defmodule DiscussWeb.Models.Topic do
  use Ecto.Schema

  schema "topics" do
    field :title, :string

    timestamps([type: :utc_datetime_usec])
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:title])
    |> Ecto.Changeset.validate_required([:title])
  end
end
