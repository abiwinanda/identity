defmodule Identity.Repo.Migrations.IdInitDb do
  use Ecto.Migration

  def change do
    create table(:id_users) do
      add :username, :string
      add :email, :string
      add :google_id, :string
      add :facebook_id, :string
      add :is_active, :boolean
    end

    create unique_index(:id_users, [:username], name: :username_unique_index)
    create unique_index(:id_users, [:email], name: :email_unique_index)
    create unique_index(:id_users, [:google_id], name: :google_id_unique_index)
    create unique_index(:id_users, [:facebook_id], name: :facebook_id_unique_index)

    create table(:id_roles) do
      add :creator_id, references(:id_users)
      add :creator_type, :string
      add :role_name, :string
    end

    create unique_index(:id_roles, [:creator_id, :role_name], name: :creator_id_role_name_unique_index)

    create table(:id_permissions) do
      add :creator_id, references(:id_users)
      add :creator_type, :string
      add :permission_name, :string
    end

    create unique_index(:id_permissions, [:creator_id, :permission_name], name: :creator_id_permission_name_unique_index)

    create table(:id_user_roles) do
      add :user_id, references(:id_users)
      add :role_id, references(:id_roles)
    end

    create unique_index(:id_user_roles, [:user_id, :role_id], name: :user_id_role_id_unique_index)

    create table(:id_user_permissions) do
      add :user_id, references(:id_users)
      add :permission_id, references(:id_permissions)
    end

    create unique_index(:id_user_permissions, [:user_id, :permission_id], name: :user_id_permission_id_unique_index)

    create table(:id_role_permissions) do
      add :role_id, references(:id_roles)
      add :permission_id, references(:id_permissions)
    end

    create unique_index(:id_role_permissions, [:role_id, :permission_id], name: :role_id_permission_id_unique_index)

    create table(:id_user_claims) do
      add :user_id, references(:id_users)
      add :claim_type, :string
      add :claim_value, :string
    end

    create table(:id_user_logins) do
      add :user_id, references(:id_users)
      add :login_type, :string
      add :login_id, :string
    end

    create unique_index(:id_user_logins, [:user_id, :login_type], name: :user_id_login_type_unique_index)
    create unique_index(:id_user_logins, [:user_id, :login_id], name: :user_id_login_id_unique_index)

    create table(:id_user_password_logins) do
      add :password, :string
    end
  end
end
