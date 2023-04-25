defmodule LvTestWeb.Component.Select do
  use LvTestWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <.input type="text" field={@field} phx-target={@myself} />
    </div>
    """
  end
end
