-ifndef(WMS_LICENSE_HRL).
-define(WMS_LICENSE_HRL, "wms_license_hrl").

-record(wms_license, {
    id = kvs:seq([],[]),
    next = [],
    prev = [],
    cn = <<>>,
    owner = <<>>,
    status = <<>>,
    license_type = <<>>,
    allowed_weapon_type = <<>>,
    allowed_category = <<>>,
    issued_by = <<>>
}).

-endif.
