defmodule Portishead.Schema.Country do
  use Ecto.Schema

  @derive {Jason.Encoder, except: [:__meta__]}
  @primary_key {:code, :string, []}
  @foreign_key_type :string
  @schema_prefix "premarcos"

  schema "country" do
    field :name, :string
  end
end
