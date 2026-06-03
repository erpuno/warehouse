defmodule EXO.WMS.Operator do
  # Proxy events to the Weapons component since it's the primary view for Operator
  def event(:init), do: EXO.WMS.Weapons.event(:init)
  def event(e), do: EXO.WMS.Weapons.event(e)
end
