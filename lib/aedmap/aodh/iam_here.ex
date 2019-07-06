defmodule Aedmap.AODH.IamHere do
  use Ecto.Schema
  import Ecto.Changeset


  schema "iam_heres" do
    field :context, :string
    field :latitude, :float
    field :longitude, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(iam_here, attrs) do
    iam_here
    |> cast(attrs, [:name, :latitude, :longitude, :context])
    |> validate_required([:name, :latitude, :longitude, :context])
  end
end
