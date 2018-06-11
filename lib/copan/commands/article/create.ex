defmodule Copan.Commands.Article.Create do
  @moduledoc """
  Creates articles given a map
  """

  import Ecto.Changeset

  def call(%Copan.Schema.User{id: id}, %Copan.Schema.Category{id: category_id}, params) do
    params
    |> Map.put(:category_id, category_id)
    |> build_changeset
    |> Copan.Repo.insert!(prefix: id)
  end

  defp build_changeset(params) do
    %Copan.Schema.Article{}
    |> cast(params, [:title, :image, :content, :description, :category_id])
    |> validate_required([:title, :content, :description])
  end
end
