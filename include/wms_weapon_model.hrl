-ifndef(WMS_WEAPON_MODEL_HRL).
-define(WMS_WEAPON_MODEL_HRL, "wms_weapon_model_hrl").

-record(wms_weapon_model, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    weapon_type = <<>>,
    caliber = <<>>,
    country = <<>>,
    category = <<>>,
    status = <<>>,
    manufacturer = <<>>
}).

-endif.
