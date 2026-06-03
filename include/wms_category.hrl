-ifndef(WMS_CATEGORY_HRL).
-define(WMS_CATEGORY_HRL, "wms_category_hrl").

-record(wms_category, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
