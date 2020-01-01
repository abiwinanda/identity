defmodule Identity.UserClaim do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_user_claims" do
    field :claim_type, :string
    field :claim_value, :string

    belongs_to :user, Identity.User,
      references: :id,
      foreign_key: :user_id
  end

  @doc false
  def changeset(user_claim, attrs) do
    user_claim
    |> cast(attrs, [
      :claim_type,
      :claim_value,
      :user_id])
    |> validate_required([:claim_type, :claim_value, :user_id])
  end

end
