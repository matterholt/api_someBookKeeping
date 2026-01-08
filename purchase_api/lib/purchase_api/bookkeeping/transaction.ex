defmodule PurchaseApi.Bookkeeping.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :amount, :decimal
    field :item, :string
    field :customer, :string
    field :typeOf, :string
    field :entryDate, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :item, :cutomer, :typeOf, :entryDate])
    |> validate_required([:amount, :item, :cutomer, :typeOf, :entryDate])
    |> validate_number(:amount, greater_than_or_equal_to: 0)
  end
end
