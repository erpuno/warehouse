-ifndef(WMS_PART_HRL).
-define(WMS_PART_HRL, "wms_part_hrl").

-record(wms_part, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    serial_number = <<>>,
    part_type = <<>>,
    part_status = <<>>,
    installed_in_weapon = <<>>,
    storage_location = <<>>,
    manufacturer = <<>>
}).

-endif.
