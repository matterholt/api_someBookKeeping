defmodule PurchaseApi.Bookkeeping.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :amount, :decimal
    field :item, :string
    field :typeOf, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :item, :typeOf])
    |> validate_required([:amount, :item, :typeOf])
  end
end
