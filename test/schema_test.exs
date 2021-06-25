defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "user queries" do
    test "when a valid id is given, returns the user", %{ conn: conn } do
      params = %{ email: "ana@email.com", name: "Ana", password: "123456" }

      { :ok, %User{id: user_id} } = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            name,
            email
          }
        }
      """
      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"getUser" => %{"email" => "ana@email.com", "name" => "Ana"}}}

      assert response == expected_response
    end
  end

  describe "users mutation" do
    test "when all params are valid, creates the user", %{ conn: conn } do

      mutation = """
        mutation {
          createUser(input: {
            name: "Clara",
            email: "clara@email.com",
            password: "123456"
          })
          {
            id,
            name
          }
        }
      """
      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Clara"}}} = response
    end
  end

end
