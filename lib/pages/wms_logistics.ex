defmodule EXO.WMS.Logistics do
  # Proxy events to the Weapons component as fallback for Logistics transfers for now
  def event(:init), do: EXO.WMS.Weapons.event(:init)
  def event(e), do: EXO.WMS.Weapons.event(e)
end
