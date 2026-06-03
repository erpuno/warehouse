-ifndef(WMS_AUDIT_EVENT_HRL).
-define(WMS_AUDIT_EVENT_HRL, "wms_audit_event_hrl").

-record(wms_audit_event, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    actor = <<>>,
    action = <<>>,
    target = <<>>,
    old_value = <<>>,
    new_value = <<>>,
    event_time = <<>>
}).

-endif.
