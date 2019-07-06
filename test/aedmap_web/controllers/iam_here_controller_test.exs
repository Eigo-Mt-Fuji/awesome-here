defmodule AedmapWeb.IamHereControllerTest do
  use AedmapWeb.ConnCase

  alias Aedmap.AODH

  @create_attrs %{context: "some context", latitude: 120.5, longitude: 120.5, name: "some name"}
  @update_attrs %{context: "some updated context", latitude: 456.7, longitude: 456.7, name: "some updated name"}
  @invalid_attrs %{context: nil, latitude: nil, longitude: nil, name: nil}

  def fixture(:iam_here) do
    {:ok, iam_here} = AODH.create_iam_here(@create_attrs)
    iam_here
  end

  describe "index" do
    test "lists all iam_heres", %{conn: conn} do
      conn = get(conn, Routes.iam_here_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Iam heres"
    end
  end

  describe "new iam_here" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.iam_here_path(conn, :new))
      assert html_response(conn, 200) =~ "New Iam here"
    end
  end

  describe "create iam_here" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.iam_here_path(conn, :create), iam_here: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.iam_here_path(conn, :show, id)

      conn = get(conn, Routes.iam_here_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Iam here"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.iam_here_path(conn, :create), iam_here: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Iam here"
    end
  end

  describe "edit iam_here" do
    setup [:create_iam_here]

    test "renders form for editing chosen iam_here", %{conn: conn, iam_here: iam_here} do
      conn = get(conn, Routes.iam_here_path(conn, :edit, iam_here))
      assert html_response(conn, 200) =~ "Edit Iam here"
    end
  end

  describe "update iam_here" do
    setup [:create_iam_here]

    test "redirects when data is valid", %{conn: conn, iam_here: iam_here} do
      conn = put(conn, Routes.iam_here_path(conn, :update, iam_here), iam_here: @update_attrs)
      assert redirected_to(conn) == Routes.iam_here_path(conn, :show, iam_here)

      conn = get(conn, Routes.iam_here_path(conn, :show, iam_here))
      assert html_response(conn, 200) =~ "some updated context"
    end

    test "renders errors when data is invalid", %{conn: conn, iam_here: iam_here} do
      conn = put(conn, Routes.iam_here_path(conn, :update, iam_here), iam_here: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Iam here"
    end
  end

  describe "delete iam_here" do
    setup [:create_iam_here]

    test "deletes chosen iam_here", %{conn: conn, iam_here: iam_here} do
      conn = delete(conn, Routes.iam_here_path(conn, :delete, iam_here))
      assert redirected_to(conn) == Routes.iam_here_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.iam_here_path(conn, :show, iam_here))
      end
    end
  end

  defp create_iam_here(_) do
    iam_here = fixture(:iam_here)
    {:ok, iam_here: iam_here}
  end
end
