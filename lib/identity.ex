defmodule Identity do
  @moduledoc """
  Identity Access Management in Elixir
  """
  require Logger
  import Ecto.Changeset

  alias Identity.Repo
  alias Identity.User
  alias Identity.Role
  alias Identity.Permission
  alias Identity.UserClaim

  @doc """
  Register a new identity user.
  """
  def register_user(username, password, opts) do

    attrs =
      %{}
      |> Map.put(:username, username)
      |> Map.put(:email, opts[:email])
      |> Map.put(:google_id, opts[:google_id])
      |> Map.put(:facebook_id, opts[:facebook_id])
      |> Map.put(:is_active, opts[:is_active] || false)

    user =
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()

    user

  catch
    :null_username_error ->
      Logger.error("Identity: Failed to register user. No username is provided")
      {:error, :null_username_error}

    :null_password_error ->
      Logger.error("Identity: Failed to register user. No password is provided")
      {:error, :null_password_error}
  end

  @doc """
  not yet implemented
  """
  def create_user() do
    :not_yet_implemented
  end

  @doc """
  Create a new identity permission
  """
  def create_permission(permission_name, creator_id) do

    if is_nil(permission_name), do: throw :null_permission_name_error
    if is_nil(creator_id), do: throw :null_creator_id_error

    attrs =
      %{}
      |> Map.put(:creator_id, creator_id)
      |> Map.put(:creator_type, "id_user")
      |> Map.put(:permission_name, permission_name)

    result =
      %Permission{}
      |> Permission.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, changeset} ->
        Logger.info("A new permission has been created. permission_name: #{permission_name}, user_id: #{creator_id}")
        {:ok, changeset}

      {:error, changeset} ->
        Logger.info("Failed to create a new permission. permission_name: #{permission_name}, user_id: #{creator_id}")
        {:error, changeset}
    end

  catch
    :null_permission_name_error ->
      Logger.error("Identity: Failed to create a new permission. No permission name is provided")
      {:error, :null_permission_name_error}

    :null_creator_id_error ->
      Logger.error("Identity: Failed to create a new permission. No creator id is provided")
      {:error, :null_creator_id}
  end

  @doc """
  Create a new identity role
  """
  def create_role(role_name, creator_id) do

    if is_nil(role_name), do: throw :null_role_name_error
    if is_nil(creator_id), do: throw :null_creator_id_error

    attrs =
      %{}
      |> Map.put(:creator_id, creator_id)
      |> Map.put(:creator_type, "id_user")
      |> Map.put(:role_name, role_name)

    result =
      %Role{}
      |> Role.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, changeset} ->
        Logger.info("A new role has been created. role_name: #{role_name}, user_id: #{creator_id}")
        {:ok, changeset}

      {:error, changeset} ->
        Logger.info("Failed to create a new role. role_name: #{role_name}, user_id: #{creator_id}")
        {:error, changeset}
    end

  catch
    :null_role_name_error ->
      Logger.error("Identity: Failed to create a new role. No role name is provided")
      {:error, :null_role_name_error}

    :null_creator_id_error ->
      Logger.error("Identity: Failed to create a new role. No creator id is provided")
      {:error, :null_creator_id}
  end

  @doc """
  Add new claim to a user
  """
  def add_claim(claim_type, claim_value, user_id) do

    if is_nil(claim_type), do: throw :null_claim_type_error
    if is_nil(claim_value), do: throw :null_claim_value_id
    if is_nil(user_id), do: throw :null_user_id_error

    attrs =
      %{}
      |> Map.put(:user_id, user_id)
      |> Map.put(:claim_type, claim_type)
      |> Map.put(:claim_value, claim_value)

    result =
      %UserClaim{}
      |> UserClaim.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, changeset} ->
        Logger.info("A new user claim has been created. claim_type: #{claim_type}, claim_value: #{claim_value}, user_id: #{user_id}")
        {:ok, changeset}

      {:error, changeset} ->
        Logger.info("Failed to create a new user claim. claim_type: #{claim_type}, claim_value: #{claim_value}, user_id: #{user_id}")
        {:error, changeset}
    end

  catch
    :null_claim_type_error ->
      Logger.error("Identity: Failed to create a new user claim. No claim type is provided")
      {:error, :null_claim_type_error}

    :null_claim_value_id ->
      Logger.error("Identity: Failed to create a new user claim. No claim value is provided")
      {:error, :null_claim_value_id}

    :null_user_id_error ->
      Logger.error("Identity: Failed to create a new user claim. No user id is provided")
      {:error, :null_user_id_error}
  end

  @doc """
  not yet implemented
  """
  def delete_user(user_id) do

    if is_nil(user_id), do: throw :null_user_id_error

    result =
      User
      |> Repo.get!(user_id)
      |> User.changeset(%{is_active: false})
      |> Repo.update()

    case result do
      {:ok, changeset} ->
        Logger.info("A user has been deleted. user_id: #{user_id}")
        {:ok, changeset}

      {:error, changeset} ->
        Logger.info("Failed to delete a user. user_id: #{user_id}")
        {:error, changeset}
    end

  catch
    :null_user_id_error ->
      Logger.error("Identity: Failed to delete a new user. No user id is provided")
      {:error, :null_user_id_error}
  end

  @doc """
  not yet implemented
  """
  def delete_permission() do
    :not_yet_implemented
  end

  @doc """
  not yet implemented
  """
  def delete_role() do
    :not_yet_implemented
  end

  @doc """
  not yet implemented
  """
  def login() do
    :not_yet_implemented
  end

end
