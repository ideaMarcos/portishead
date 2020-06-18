defmodule Portishead.Schema.Band do
  use Portishead.Schema.Common

  schema "band" do
    field :name, :string
    field :country_code, :string

    common_fields()
  end

  def changeset(%__MODULE__{} = record, params \\ %{}) do
    # changes =
    #   params
    #   |> Enum.reject(fn {_, v} -> is_nil(v) or v == "" end)
    #   |> Enum.into(%{})

    record
    |> cast(params, [:uuid, :name, :country_code, :metadata])
    |> validate_required([:uuid, :name])
    |> validate_length(:name, max: 255)
    |> validate_length(:country_code, max: 255)
  end
end
