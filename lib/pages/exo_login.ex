defmodule EXO.Login do
  require FORM
  require EXO

  def findByPhone(phone, list) do
    :lists.foldl(
      fn x, acc ->
        case EXO.client(x, :phone) == phone do
          true -> [x | acc]
          false -> acc
        end
      end,
      [],
      list
    )
  end

  def event(:init) do
    :nitro.clear(:stand)
    mod = BPE.Pass
    form = mod.new(mod, mod.id(), [])
    html = :form.new(form, mod.id(), [])
    :nitro.insert_bottom(:stand, html)
  end

  def event({:Next, _}) do
    phone = :nitro.q(:number_phone_none)
    case phone do
      "1" -> :nitro.redirect("wms/operator.htm")
      "2" -> :nitro.redirect("wms/repair.htm")
      "3" -> :nitro.redirect("wms/logistics.htm")
      "4" -> :nitro.redirect("wms/console.htm")
      _ -> :nitro.redirect("wms/operator.htm")
    end
  end

  def event({:Close, _}), do: :nitro.redirect("index.htm")
  def event(_), do: :ok
end
