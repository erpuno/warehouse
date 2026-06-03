-ifndef(WMS_STORAGE_LOCATION_HRL).
-define(WMS_STORAGE_LOCATION_HRL, "wms_storage_location_hrl").

-record(wms_storage_location, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
