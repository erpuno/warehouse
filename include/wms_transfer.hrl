-ifndef(WMS_TRANSFER_HRL).
-define(WMS_TRANSFER_HRL, "wms_transfer_hrl").

-record(wms_transfer, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    weapon = <<>>,
    from_storage = <<>>,
    to_storage = <<>>,
    transfer_status = <<>>
}).

-endif.
