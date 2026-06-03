-ifndef(WMS_SERVICE_ACT_HRL).
-define(WMS_SERVICE_ACT_HRL, "wms_service_act_hrl").

-record(wms_service_act, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    service_order = <<>>,
    weapon = <<>>,
    summary = <<>>,
    result = <<>>,
    approved_by = <<>>
}).

-endif.
