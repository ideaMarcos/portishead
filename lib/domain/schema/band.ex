defmodule Portishead.Schema.Band do
  use Portishead.Schema.Common

  schema "band" do
    field :name, :string
    field :hometown, :string

    common_fields()
  end

  def changeset(%__MODULE__{} = record, params \\ %{}) do
    # changes =
    #   params
    #   |> Enum.reject(fn {_, v} -> is_nil(v) or v == "" end)
    #   |> Enum.into(%{})

    record
    |> cast(params, [:uuid, :name, :hometown, :metadata])
    |> validate_required([:uuid, :name])
    |> validate_length(:name, max: 255)
    |> validate_length(:hometown, max: 255)
  end
end
