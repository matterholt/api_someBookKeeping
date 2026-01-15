defmodule PurchaseApiWeb.HelloController do
  use PurchaseApiWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
