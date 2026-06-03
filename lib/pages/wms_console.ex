defmodule EXO.WMS.Console do
  # Proxy events to the Weapons component for global view
  def event(:init), do: EXO.WMS.Weapons.event(:init)
  def event(e), do: EXO.WMS.Weapons.event(e)
end
