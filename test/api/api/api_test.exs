defmodule Api.ApiTest do
  use Api.DataCase

  alias Api.Api

  describe "observations" do
    alias Api.Api.Observation

    @valid_attrs %{x1: 42, x2: 42}
    @update_attrs %{x1: 43, x2: 43}
    @invalid_attrs %{x1: nil, x2: nil}

    def observation_fixture(attrs \\ %{}) do
      {:ok, observation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_observation()

      observation
    end

    test "list_observations/0 returns all observations" do
      observation = observation_fixture()
      assert Api.list_observations() == [observation]
    end

    test "get_observation!/1 returns the observation with given id" do
      observation = observation_fixture()
      assert Api.get_observation!(observation.id) == observation
    end

    test "create_observation/1 with valid data creates a observation" do
      assert {:ok, %Observation{} = observation} = Api.create_observation(@valid_attrs)
      assert observation.x1 == 42
      assert observation.x2 == 42
    end

    test "create_observation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_observation(@invalid_attrs)
    end

    test "update_observation/2 with valid data updates the observation" do
      observation = observation_fixture()
      assert {:ok, observation} = Api.update_observation(observation, @update_attrs)
      assert %Observation{} = observation
      assert observation.x1 == 43
      assert observation.x2 == 43
    end

    test "update_observation/2 with invalid data returns error changeset" do
      observation = observation_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_observation(observation, @invalid_attrs)
      assert observation == Api.get_observation!(observation.id)
    end

    test "delete_observation/1 deletes the observation" do
      observation = observation_fixture()
      assert {:ok, %Observation{}} = Api.delete_observation(observation)
      assert_raise Ecto.NoResultsError, fn -> Api.get_observation!(observation.id) end
    end

    test "change_observation/1 returns a observation changeset" do
      observation = observation_fixture()
      assert %Ecto.Changeset{} = Api.change_observation(observation)
    end
  end
end
