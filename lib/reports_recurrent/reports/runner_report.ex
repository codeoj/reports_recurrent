defmodule ReportsRecurrent.Reports.RunnerReport do
  use GenServer
  require Logger
  alias ReportsRecurrent.Reports.StreamReport

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    schedule_report()
    IO.puts("start")
    {:ok, state}
  end

  @impl true
  def handle_info(message, state) do
    Logger.info("Generating")
    schedule_report()

    StreamReport.csv(%{"schedule" => "day"})
    {:noreply, state}
  end

  def schedule_report do
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 24)
  end
end
