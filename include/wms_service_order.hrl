-ifndef(WMS_SERVICE_ORDER_HRL).
-define(WMS_SERVICE_ORDER_HRL, "wms_service_order_hrl").

-record(wms_service_order, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    weapon = <<>>,
    reason = <<>>,
    received_by = <<>>,
    service_status = <<>>,
    result = <<>>
}).

-endif.
