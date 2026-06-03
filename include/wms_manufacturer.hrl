-ifndef(WMS_MANUFACTURER_HRL).
-define(WMS_MANUFACTURER_HRL, "wms_manufacturer_hrl").

-record(wms_manufacturer, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    sn = <<>>
}).

-endif.
