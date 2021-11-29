defmodule AppWeb.CORS do
  use Corsica.Router,
    origins: "*",
    allow_headers: ["accept", "authorization", "content-type", "origin", "x-requested-with"]

  resource("/*")
end
