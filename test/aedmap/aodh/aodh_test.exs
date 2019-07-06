defmodule Aedmap.AODHTest do
  use Aedmap.DataCase

  alias Aedmap.AODH

  describe "iam_heres" do
    alias Aedmap.AODH.IamHere

    @valid_attrs %{context: "some context", latitude: 120.5, longitude: 120.5, name: "some name"}
    @update_attrs %{context: "some updated context", latitude: 456.7, longitude: 456.7, name: "some updated name"}
    @invalid_attrs %{context: nil, latitude: nil, longitude: nil, name: nil}

    def iam_here_fixture(attrs \\ %{}) do
      {:ok, iam_here} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AODH.create_iam_here()

      iam_here
    end

    test "list_iam_heres/0 returns all iam_heres" do
      iam_here = iam_here_fixture()
      assert AODH.list_iam_heres() == [iam_here]
    end

    test "get_iam_here!/1 returns the iam_here with given id" do
      iam_here = iam_here_fixture()
      assert AODH.get_iam_here!(iam_here.id) == iam_here
    end

    test "create_iam_here/1 with valid data creates a iam_here" do
      assert {:ok, %IamHere{} = iam_here} = AODH.create_iam_here(@valid_attrs)
      assert iam_here.context == "some context"
      assert iam_here.latitude == 120.5
      assert iam_here.longitude == 120.5
      assert iam_here.name == "some name"
    end

    test "create_iam_here/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AODH.create_iam_here(@invalid_attrs)
    end

    test "update_iam_here/2 with valid data updates the iam_here" do
      iam_here = iam_here_fixture()
      assert {:ok, %IamHere{} = iam_here} = AODH.update_iam_here(iam_here, @update_attrs)
      assert iam_here.context == "some updated context"
      assert iam_here.latitude == 456.7
      assert iam_here.longitude == 456.7
      assert iam_here.name == "some updated name"
    end

    test "update_iam_here/2 with invalid data returns error changeset" do
      iam_here = iam_here_fixture()
      assert {:error, %Ecto.Changeset{}} = AODH.update_iam_here(iam_here, @invalid_attrs)
      assert iam_here == AODH.get_iam_here!(iam_here.id)
    end

    test "delete_iam_here/1 deletes the iam_here" do
      iam_here = iam_here_fixture()
      assert {:ok, %IamHere{}} = AODH.delete_iam_here(iam_here)
      assert_raise Ecto.NoResultsError, fn -> AODH.get_iam_here!(iam_here.id) end
    end

    test "change_iam_here/1 returns a iam_here changeset" do
      iam_here = iam_here_fixture()
      assert %Ecto.Changeset{} = AODH.change_iam_here(iam_here)
    end
  end
end
