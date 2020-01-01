defmodule Identity.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_roles" do
    field :creator_type, :string
    field :role_name, :string

    belongs_to :user, Identity.User,
      references: :id,
      foreign_key: :creator_id
    many_to_many :users, Identity.User, join_through: "id_user_roles"
    many_to_many :permissions, Identity.Permission, join_through: "id_role_permissions"
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [
      :creator_type,
      :role_name,
      :creator_id])
    |> validate_required([:creator_type, :role_name])
  end

  def put_user_assoc(role, user) do
    role
    |> put_assoc(:user, [user])
  end

end
