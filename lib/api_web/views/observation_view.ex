defmodule ApiWeb.ObservationView do
  use ApiWeb, :view
  alias ApiWeb.ObservationView

  def render("index.json", %{observations: observations}) do
    %{data: render_many(observations, ObservationView, "observation.json")}
  end

  def render("show.json", %{observation: observation}) do
    %{data: render_one(observation, ObservationView, "observation.json")}
  end

  def render("observation.json", %{observation: observation}) do
    %{id: observation.id,
      x1: observation.x1,
      x2: observation.x2}
  end
end
