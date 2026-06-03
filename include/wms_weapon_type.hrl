-ifndef(WMS_WEAPON_TYPE_HRL).
-define(WMS_WEAPON_TYPE_HRL, "wms_weapon_type_hrl").

-record(wms_weapon_type, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
