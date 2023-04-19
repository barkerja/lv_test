defmodule LvTest.Repo do
  use Ecto.Repo,
    otp_app: :lv_test,
    adapter: Ecto.Adapters.Postgres
end
