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

end
