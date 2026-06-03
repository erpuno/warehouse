defmodule EXO.WMS.Weapons do
  require EXO
  require NITRO
  require Logger

  def event(:init) do
    :nitro.clear(:tableHead)
    :nitro.clear(:tableRow)
    :nitro.insert_top(:tableHead, header())
    :nitro.clear(:frms)
    :nitro.clear(:ctrl)

    mod = WMS.Weapon.Form
    form = :form.new(mod.new(:none, mod.id(), []), mod.id(), [])
    :nitro.insert_bottom(:frms, form)

    :nitro.insert_bottom(
      :ctrl,
      NITRO.link(id: :creator, body: "Додати зброю", postback: :create, class: [:button, :sgreen])
    )

    :nitro.hide(:frms)

    :lists.map(
      fn x ->
        :nitro.insert_top(
          :tableRow,
          WMS.Weapon.Row.new(:form.atom([:row, EXO.wms_weapon(x, :id)]), x, [])
        )
      end,
      :kvs.all(~c"/wms/weapons")
    )
  end

  def event(:create) do
    :nitro.hide(:ctrl)
    :nitro.show(:frms)
  end

  def event({:SaveWeapon, _}) do
    serial_number = :serial_number_wms_weapon_none |> :nitro.q()
    model = :weapon_model_wms_weapon_none |> :nitro.q()
    owner = :owner_wms_weapon_none |> :nitro.q()
    location = :storage_location_wms_weapon_none |> :nitro.q()
    status = :status_wms_weapon_none |> :nitro.q()
    id = :kvs.seq([], [])

    weapon = EXO.wms_weapon(
      id: id,
      serial_number: serial_number,
      weapon_model: model,
      owner: owner,
      storage_location: location,
      status: status
    )
    :kvs.append(weapon, ~c"/wms/weapons")

    row = WMS.Weapon.Row.new(:form.atom([:row, id]), weapon, [])
    :nitro.insert_top(:tableRow, :form.new(row, weapon, []))

    :nitro.hide(:frms)
    :nitro.show(:ctrl)
  end

  def event({:Close, []}) do
    :nitro.hide(:frms)
    :nitro.show(:ctrl)
  end

  def event(x) do
    Logger.info("Weapons event: #{inspect(x)}")
  end

  def header() do
    NITRO.panel(
      id: :header,
      class: :th,
      body: [
        NITRO.panel(class: :column10, body: "ID"),
        NITRO.panel(class: :column20, body: "Серійний номер"),
        NITRO.panel(class: :column20, body: "Модель"),
        NITRO.panel(class: :column30, body: "Власник"),
        NITRO.panel(class: :column20, body: "Статус")
      ]
    )
  end
end
