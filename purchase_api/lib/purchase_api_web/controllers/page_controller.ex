defmodule PurchaseApiWeb.PageController do
  use PurchaseApiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
