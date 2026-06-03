-ifndef(WMS_STATUS_HRL).
-define(WMS_STATUS_HRL, "wms_status_hrl").

-record(wms_status, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
