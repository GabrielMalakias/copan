defmodule Copan.Util.CastUuid do
  def call(binary_uuid) do
    %{ok: id} = Ecto.UUID.cast(binary_uuid)
    id
  end
end
