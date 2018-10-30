defmodule Api.Repo.Migrations.CreateObservations do
  use Ecto.Migration

  def change do
    create table(:observations) do
      add :x1, :integer
      add :x2, :integer

      timestamps()
    end

  end
end
