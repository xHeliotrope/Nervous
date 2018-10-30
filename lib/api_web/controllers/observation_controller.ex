defmodule ApiWeb.ObservationController do
  use ApiWeb, :controller

  alias Api.Api
  alias Api.Api.Observation

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    observations = Api.list_observations()
    render(conn, "index.json", observations: observations)
  end

  def create(conn, %{"observation" => observation_params}) do
    with {:ok, %Observation{} = observation} <- Api.create_observation(observation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", observation_path(conn, :show, observation))
      |> render("show.json", observation: observation)
    end
  end

  def show(conn, %{"id" => id}) do
    observation = Api.get_observation!(id)
    render(conn, "show.json", observation: observation)
  end

  def update(conn, %{"id" => id, "observation" => observation_params}) do
    observation = Api.get_observation!(id)

    with {:ok, %Observation{} = observation} <- Api.update_observation(observation, observation_params) do
      render(conn, "show.json", observation: observation)
    end
  end

  def delete(conn, %{"id" => id}) do
    observation = Api.get_observation!(id)
    with {:ok, %Observation{}} <- Api.delete_observation(observation) do
      send_resp(conn, :no_content, "")
    end
  end
end
