defmodule LvTestWeb.Example do
  use LvTestWeb, :live_view

  def render(assigns) do
    ~H"""
    <div id="lv_example">
      <.form :let={f} for={@form} id="form-example" phx-change="preserve_form">
        <.live_component
          module={LvTestWeb.Component.Select}
          id="component-field-b"
          field={f[:component_field_b]}
        />
        <.input field={f[:my_input]} id="my-input" />
      </.form>
    </div>
    """
  end

  def handle_event("preserve_form", params, socket) do
    socket = assign(socket, form: to_form(params))

    {:noreply, socket}
  end

  def mount(_params, _session, socket) do
    # Use PID to kill the LV process to debug the form recovery issue
    if connected?(socket), do: IO.puts("PID: #{inspect(self())}")

    {:ok, assign(socket, form: to_form(%{}))}
  end
end
