defmodule LvTestWeb.Example do
  use LvTestWeb, :live_view

  def render(assigns) do
    ~H"""
    <div id="lv_example">
      <.live_component module={LvTestWeb.Component.A} id="a" />
      <.live_component module={LvTestWeb.Component.B} id="b" time={@time} />
    </div>
    """
  end

  def handle_info(:update, socket) do
    IO.inspect(socket.assigns, label: "Example.handle_info/2 socket.assigns", pretty: true)

    Process.send_after(self(), :update, 1000)

    {:noreply, assign(socket, :time, DateTime.utc_now())}
  end

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :update, 1000)
    end

    {:ok, assign(socket, :time, DateTime.utc_now())}
  end
end
