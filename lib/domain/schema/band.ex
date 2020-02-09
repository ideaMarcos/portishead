defmodule Portishead.Schema.Band do
  use Portishead.Schema.Common

  schema "band" do
    field :name, :string
    field :hometown, :string

    common_fields()
  end

  def changeset(%__MODULE__{} = band, params \\ %{}) do
    band
    |> cast(params, [:name, :hometown, :metadata])
    |> validate_required([:name])
  end
end
