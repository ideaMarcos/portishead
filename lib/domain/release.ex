defmodule Portishead.Release do
  # https://hexdocs.pm/ecto_sql/Ecto.Migrator.html
  # https://hexdocs.pm/ecto_sql/Mix.Tasks.Ecto.Migrations.html

  @app :portishead

  def migrate do
    for repo <- repos() do
      {:ok, _, _} =
        Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true, log: :debug))
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} =
      Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version, log: :debug))
  end

  def migrations() do
    for repo <- repos() do
      case Ecto.Migrator.with_repo(repo, &Ecto.Migrator.migrations(&1)) do
        {:ok, repo_status, _} ->
          IO.puts(
            """
            Repo: #{inspect(repo)}
              Status    Migration ID    Migration Name
            --------------------------------------------------
            """ <>
              Enum.map_join(repo_status, "\n", fn {status, number, description} ->
                "  #{format(status, 10)}#{format(number, 16)}#{description}"
              end) <> "\n"
          )

        {:error, error} ->
          Mix.raise("Could not start repo #{inspect(repo)}, error: #{inspect(error)}")
      end
    end
  end

  defp format(content, pad) do
    content
    |> to_string
    |> String.pad_trailing(pad)
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
