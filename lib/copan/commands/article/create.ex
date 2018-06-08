defmodule Copan.Commands.Article.Create do
  @moduledoc """
  Creates articles given a map
  """

  import Ecto.Changeset

  def call(params, prefix) do
    params
    |> build_changeset
    |> Copan.Repo.insert!(prefix: prefix)
  end

  defp build_changeset(params) do
    %Copan.Schema.Article{}
    |> cast(params, [:title, :image, :content, :description, :category_id])
    |> validate_required([:title, :content, :description])
  end
end
