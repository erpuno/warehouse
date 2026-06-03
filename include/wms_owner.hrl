-ifndef(WMS_OWNER_HRL).
-define(WMS_OWNER_HRL, "wms_owner_hrl").

-record(wms_owner, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
