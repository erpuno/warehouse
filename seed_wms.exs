require EXO

# Delete old records
Enum.each(:kvs.all(EXO.wms_weapon_model()), fn m -> :kvs.delete(EXO.wms_weapon_model(), EXO.wms_weapon_model(m, :id)) end)
Enum.each(:kvs.all(EXO.wms_weapon()), fn m -> :kvs.delete(EXO.wms_weapon(), EXO.wms_weapon(m, :id)) end)
Enum.each(:kvs.all(EXO.wms_service_order()), fn m -> :kvs.delete(EXO.wms_service_order(), EXO.wms_service_order(m, :id)) end)

# Delete writers
:kvs.delete(:writer, EXO.wms_weapon_model())
:kvs.delete(:writer, EXO.wms_weapon())
:kvs.delete(:writer, EXO.wms_service_order())

EXO.Boot.wms()
