defmodule SWS.RequestHandler do
  def init(request, options) do
    path = :cowboy_req.path(request)
    {status, headers, body} =  handle_path(path)
    response = :cowboy_req.reply(status, headers, body, request)
    {:ok, response, options}
  end

  def handle_path("/random"), do: random_response()
  def handle_path("/success"), do: {200, [{"content-type", "text/plain"}], "ok"}
  def handle_path("/error"), do: {500, [{"content-type", "text/plain"}], "internal server error"}
  def handle_path(_), do: {404, [{"content-type", "text/plain"}], "Page Not Found"}

  def random_response() do
    [
      {500, [{"content-type", "text/plain"}], "internal server error"},
      {401, [{"content-type", "text/plain"}], "Unauthorized"},
      {403, [{"content-type", "text/plain"}], "Forbidden"},
      {422, [{"content-type", "text/plain"}], "Unprocessable Entity"},
      {200, [{"content-type", "text/plain"}], "ok"}
    ]
    |> Enum.random
  end
end
