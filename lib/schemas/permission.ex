defmodule Identity.Permission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_permissions" do
    field :creator_type, :string
    field :permission_name, :string

    belongs_to :user, Identity.User,
      references: :id,
      foreign_key: :creator_id
    many_to_many :users, Identity.User, join_through: "id_user_permissions"
    many_to_many :roles, Identity.Role, join_through: "id_role_permissions"
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [
      :creator_type,
      :permission_name,
      :creator_id])
    |> validate_required([:creator_type, :permission_name])
  end

end
