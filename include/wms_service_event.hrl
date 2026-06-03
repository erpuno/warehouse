-ifndef(WMS_SERVICE_EVENT_HRL).
-define(WMS_SERVICE_EVENT_HRL, "wms_service_event_hrl").

-record(wms_service_event, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    service_order = <<>>,
    weapon = <<>>,
    event_type = <<>>,
    actor = <<>>,
    event_status = <<>>,
    condition = <<>>,
    required_action = <<>>,
    result = <<>>,
    old_part = <<>>,
    new_part = <<>>
}).

-endif.
