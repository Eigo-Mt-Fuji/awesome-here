defmodule Aedmap.AODH do
  @moduledoc """
  The AODH context.
  """

  import Ecto.Query, warn: false
  alias Aedmap.Repo

  alias Aedmap.AODH.IamHere

  @doc """
  Returns the list of iam_heres.

  ## Examples

      iex> list_iam_heres()
      [%IamHere{}, ...]

  """
  def list_iam_heres do
    Repo.all(IamHere)
  end

  @doc """
  Gets a single iam_here.

  Raises `Ecto.NoResultsError` if the Iam here does not exist.

  ## Examples

      iex> get_iam_here!(123)
      %IamHere{}

      iex> get_iam_here!(456)
      ** (Ecto.NoResultsError)

  """
  def get_iam_here!(id), do: Repo.get!(IamHere, id)

  @doc """
  Creates a iam_here.

  ## Examples

      iex> create_iam_here(%{field: value})
      {:ok, %IamHere{}}

      iex> create_iam_here(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_iam_here(attrs \\ %{}) do
    %IamHere{}
    |> IamHere.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a iam_here.

  ## Examples

      iex> update_iam_here(iam_here, %{field: new_value})
      {:ok, %IamHere{}}

      iex> update_iam_here(iam_here, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_iam_here(%IamHere{} = iam_here, attrs) do
    iam_here
    |> IamHere.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a IamHere.

  ## Examples

      iex> delete_iam_here(iam_here)
      {:ok, %IamHere{}}

      iex> delete_iam_here(iam_here)
      {:error, %Ecto.Changeset{}}

  """
  def delete_iam_here(%IamHere{} = iam_here) do
    Repo.delete(iam_here)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking iam_here changes.

  ## Examples

      iex> change_iam_here(iam_here)
      %Ecto.Changeset{source: %IamHere{}}

  """
  def change_iam_here(%IamHere{} = iam_here) do
    IamHere.changeset(iam_here, %{})
  end
end
