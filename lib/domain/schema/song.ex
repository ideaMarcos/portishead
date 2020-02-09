defmodule Portishead.Schema.Song do
  use Portishead.Schema.Common

  schema "song" do
    field :title, :string
    field :band_uuid, Ecto.UUID
    field :external_id, Ecto.UUID, autogenerate: true
  end

  def changeset(%__MODULE__{} = band, params \\ %{}) do
    band
    |> cast(params, [:title, :band_uuid, :external_id, :metadata])
    |> validate_required([:name])
  end
end
