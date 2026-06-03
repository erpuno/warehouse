-ifndef(WMS_WEAPON_HRL).
-define(WMS_WEAPON_HRL, "wms_weapon_hrl").

-record(wms_weapon, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    serial_number = <<>>,
    weapon_model = <<>>,
    owner = <<>>,
    license = <<>>,
    storage_location = <<>>,
    status = <<>>
}).

-endif.
