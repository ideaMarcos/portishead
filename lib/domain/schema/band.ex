defmodule Portishead.Schema.Band do
  use Portishead.Schema.Common

  schema "band" do
    field :name, :string
    field :hometown, :string
    field :external_id, Ecto.UUID, autogenerate: true

    timestamps()
  end

  def changeset(%__MODULE__{} = record, params \\ %{}) do
    # changes =
    #   params
    #   |> Enum.reject(fn {_, v} -> is_nil(v) or v == "" end)
    #   |> Enum.into(%{})
    
    record
    |> cast(params, [:name, :hometown, :external_id])
    |> validate_required([:uuid, :name])
    |> validate_length(:name, max: 255)
    |> validate_length(:hometown, max: 255)
  end
end
