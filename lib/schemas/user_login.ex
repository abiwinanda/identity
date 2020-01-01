defmodule Identity.UserLogin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_user_logins" do
    field :login_type, :string
    field :login_id, :string

    belongs_to :user, Identity.User,
      references: :id,
      foreign_key: :user_id
  end

end
