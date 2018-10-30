defmodule Api.Api.Observation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "observations" do
    field :x1, :integer
    field :x2, :integer

    timestamps()
  end

  @doc false
  def changeset(observation, attrs) do
    observation
    |> cast(attrs, [:x1, :x2])
    |> validate_required([:x1, :x2])
  end
end
