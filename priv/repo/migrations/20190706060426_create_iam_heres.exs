defmodule Aedmap.Repo.Migrations.CreateIamHeres do
  use Ecto.Migration

  def change do
    create table(:iam_heres) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float
      add :context, :string

      timestamps()
    end

  end
end
