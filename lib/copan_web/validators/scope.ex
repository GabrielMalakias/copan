defmodule Copan.Validators.Scope do
  require Logger

  def validate(value) do
    Ecto.UUID.cast(value)
    |> to_result
  end

  defp to_result(:error) do
    {:error, "UUID is not valid"}
  end

  defp to_result(value) do
    value
  end
end
