defmodule LvTestWeb.Component.B do
  use LvTestWeb, :live_component

  def update(assigns, socket) do
    IO.inspect(assigns, label: "B.update/2 assigns", pretty: true)

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <div id={@id}>
      I am component B - <%= @time %>
    </div>
    """
  end
end
