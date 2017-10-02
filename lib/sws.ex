defmodule SWS do
  require Logger
  use Application

  def start(_type, _args) do
    port = Application.get_env(:sws, :port)

    path_list = [
      {"/[...]", SWS.RequestHandler, []},
    ]

    routes = [{:_, path_list}]
    dispatch = :cowboy_router.compile(routes)
    opts = [port: port]
    env = [dispatch: dispatch]
    onresponse = fn(status, _headers, _body, request) ->
      Logger.info("#{inspect :cowboy_req.method(request)} #{inspect :cowboy_req.path(request)} - #{inspect status}")
      request
    end

    :cowboy.start_http(:http, 100, opts,
      [env: env, onresponse: onresponse])
  end
end
