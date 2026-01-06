defmodule PurchaseApi.Repo do
  use Ecto.Repo,
    otp_app: :purchase_api,
    adapter: Ecto.Adapters.Postgres
end
