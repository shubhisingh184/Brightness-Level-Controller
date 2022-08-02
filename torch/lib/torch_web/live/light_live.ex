defmodule TorchWeb.LightLive do
  use TorchWeb, :live_view

  def mount(_param, _session,socket) do
    socket=assign(socket, :brightness ,10)
    {:ok,socket}
  end

  def render(assigns) do
    ~L"""
    <h1> Brightness Adjustment </h1>
<div id="light">
    <div class="meter" style="display: flex;
    overflow: hidden;
    background-color: #e2e8f0;
    border-radius: 0.75rem;
    margin-bottom: 2rem;
    height: 4rem;">

    <span style="display: flex;
    flex-direction: column;
    text-align: center;
    justify-content: center;text-align: center;
    white-space: nowrap;
    font-weight: 700;
    font-size: 1.5rem;
    transition: width 2s ease;
     background-color: yellow;
      width: <%= @brightness %>%">
      <%= @brightness %>%

    </span>
  </div>
        <button phx-click="off">
          Off
          </button>


        <button phx-click="up">
        Up
        </button>

        <button phx-click="down">
        Down
        </button>

        <button phx-click="on">
        On
        </button>

   </div>
    """
  end

  def handle_event("on",_,socket) do
    socket=assign(socket, :brightness ,100)
    {:noreply,socket}
  end

  def handle_event("up",_,socket) do
    brightness=socket.assigns.brightness+10
    socket=assign(socket, :brightness ,brightness)
    {:noreply,socket}
  end

  def handle_event("down",_,socket) do

    socket=update(socket, :brightness ,&(&1-10))
    {:noreply,socket}
  end

  def handle_event("off",_,socket) do

    socket=assign(socket, :brightness ,0)
    {:noreply,socket}
  end

end
