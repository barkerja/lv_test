defmodule LvTestWeb.Component.A do
  use LvTestWeb, :live_component

  def update(assigns, socket) do
    IO.inspect(assigns, label: "A.update/2 assigns", pretty: true)

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <div id={@id}>
      I am component A
    </div>
    """
  end

  def mount(socket) do
    {:ok, assign(socket, %{a: 1, b: 2, c: 3})}
  end
end
