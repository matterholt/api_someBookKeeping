defmodule PurchaseApi.Repo.Migrations.AddColumns do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :customer, :string
      add :entryDate, :date
    end
  end
end
