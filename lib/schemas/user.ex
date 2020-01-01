defmodule Identity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_users" do
    field :username, :string
    field :email, :string
    field :google_id, :string
    field :facebook_id, :string
    field :is_active, :boolean

    has_many :claims, Identity.UserClaim
    has_many :user_logins, Identity.UserLogin
    many_to_many :roles, Identity.Role, join_through: "id_user_roles"
    many_to_many :permissions, Identity.Permission, join_through: "id_user_permissions"
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :username,
      :email,
      :google_id,
      :facebook_id,
      :is_active])
    |> validate_required([:username, :email])
  end

end
