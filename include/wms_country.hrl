-ifndef(WMS_COUNTRY_HRL).
-define(WMS_COUNTRY_HRL, "wms_country_hrl").

-record(wms_country, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>
}).

-endif.
