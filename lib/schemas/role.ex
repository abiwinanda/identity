defmodule Identity.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_roles" do
    field :creator_type, :string
    field :role_name, :string

    belongs_to :user, Identity.User,
      references: :id,
      foreign_key: :creator_id
    many_to_many :users, Identity.User, join_through: "user_roles"
    many_to_many :permissions, Identity.Permission, join_through: "role_permissions"
  end

end
