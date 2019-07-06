defmodule AedmapWeb.IamHereController do
  use AedmapWeb, :controller

  alias Aedmap.AODH
  alias Aedmap.AODH.IamHere

  def index(conn, _params) do
    iam_heres = AODH.list_iam_heres()
    render(conn, "index.html", iam_heres: iam_heres)
  end

  def new(conn, _params) do
    changeset = AODH.change_iam_here(%IamHere{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"iam_here" => iam_here_params}) do
    case AODH.create_iam_here(iam_here_params) do
      {:ok, iam_here} ->
        conn
        |> put_flash(:info, "Iam here created successfully.")
        |> redirect(to: Routes.iam_here_path(conn, :show, iam_here))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    iam_here = AODH.get_iam_here!(id)
    render(conn, "show.html", iam_here: iam_here)
  end

  def edit(conn, %{"id" => id}) do
    iam_here = AODH.get_iam_here!(id)
    changeset = AODH.change_iam_here(iam_here)
    render(conn, "edit.html", iam_here: iam_here, changeset: changeset)
  end

  def update(conn, %{"id" => id, "iam_here" => iam_here_params}) do
    iam_here = AODH.get_iam_here!(id)

    case AODH.update_iam_here(iam_here, iam_here_params) do
      {:ok, iam_here} ->
        conn
        |> put_flash(:info, "Iam here updated successfully.")
        |> redirect(to: Routes.iam_here_path(conn, :show, iam_here))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", iam_here: iam_here, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    iam_here = AODH.get_iam_here!(id)
    {:ok, _iam_here} = AODH.delete_iam_here(iam_here)

    conn
    |> put_flash(:info, "Iam here deleted successfully.")
    |> redirect(to: Routes.iam_here_path(conn, :index))
  end
end
