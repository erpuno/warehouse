defmodule EXO.WMS.Repair do
  # Proxy events to the Services component since it's the primary view for Repair
  def event(:init), do: EXO.WMS.Services.event(:init)
  def event(e), do: EXO.WMS.Services.event(e)
end
