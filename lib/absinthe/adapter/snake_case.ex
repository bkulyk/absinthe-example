defmodule Absinthe.Adapter.SnakeCase do
  use Absinthe.Adapter
  alias Absinthe.Utils

  @doc "Converts a camelCase to snake_case"
  def to_internal_name(nil, _role) do
    nil
  end
  def to_internal_name("__" <> camelized_name, role) do
    "__" <> to_internal_name(camelized_name, role)
  end
  def to_internal_name(camelized_name, :operation) do
    camelized_name
  end
  def to_internal_name(camelized_name, _role) do
    camelized_name
    |> Macro.underscore
  end

  @doc "Converts a camelCased name to snake_case"
  def to_external_name(nil, _role) do
    nil
  end
  def to_external_name("__" <> underscored_name, role) do
    "__" <> to_external_name(underscored_name, role)
  end
  def to_external_name(<< c :: utf8, _ :: binary>> = name, _) when c in ?A..?Z do
    name |> Macro.underscore
  end
  def to_external_name(underscored_name, _role) do
    underscored_name
    |> Macro.underscore
  end

end
