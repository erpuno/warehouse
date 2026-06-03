-ifndef(WMS_CALIBER_HRL).
-define(WMS_CALIBER_HRL, "wms_caliber_hrl").

-record(wms_caliber, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
