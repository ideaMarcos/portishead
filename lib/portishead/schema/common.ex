defmodule PortisheadService.Schema.Common do
  # https://github.com/phoenixframework/phoenix/issues/2910
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @derive {Jason.Encoder, except: [:__meta__]}
      @primary_key {:uuid, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
      # @schema_prefix "public"
      # @timestamps_opts [inserted_at: :created_at]
    end
  end

  # https://stackoverflow.com/questions/52677855/call-a-custom-macro-in-an-ecto-schema-block
  defmacro common_fields do
    quote do
      field :some_field, :string
    end
  end
end
