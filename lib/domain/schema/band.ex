defmodule PortisheadService.Schema.Band do
  use PortisheadService.Schema.Common

  schema "band" do
    field :name, :string
    field :hometown, :string
    field :external_id, Ecto.UUID, autogenerate: true

    timestamps()
  end

  def changeset(%__MODULE__{} = band, params \\ %{}) do
    band
    |> cast(params, [:name, :hometown, :external_id])
    |> validate_required([:name])
  end
end
