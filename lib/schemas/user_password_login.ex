defmodule Identity.UserPasswordLogin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "id_user_password_logins" do
    field :password, :string
  end

end
