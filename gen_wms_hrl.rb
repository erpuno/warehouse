require 'fileutils'

entities = {
  "wms_weapon_model" => ["cn", "weaponType", "caliber", "country", "category", "status", "manufacturer"],
  "wms_weapon" => ["cn", "serialNumber", "weaponModel", "owner", "license", "storageLocation", "status"],
  "wms_manufacturer" => ["cn", "sn"],
  "wms_owner" => ["cn"],
  "wms_license" => ["cn", "owner", "status", "licenseType", "allowedWeaponType", "allowedCategory", "issuedBy"],
  "wms_storage_location" => ["cn"],
  "wms_transfer" => ["cn", "weapon", "fromStorage", "toStorage", "transferStatus"],
  "wms_weapon_event" => ["cn", "weapon", "eventType", "actor", "eventStatus", "fromStorage", "toStorage", "relatedServiceOrder", "relatedPart"],
  "wms_service_order" => ["cn", "weapon", "reason", "receivedBy", "serviceStatus", "result"],
  "wms_service_event" => ["cn", "serviceOrder", "weapon", "eventType", "actor", "eventStatus", "condition", "requiredAction", "result", "oldPart", "newPart"],
  "wms_service_act" => ["cn", "serviceOrder", "weapon", "summary", "result", "approvedBy"],
  "wms_part" => ["cn", "serialNumber", "partType", "partStatus", "installedInWeapon", "storageLocation", "manufacturer"],
  "wms_audit_event" => ["cn", "actor", "action", "target", "oldValue", "newValue", "eventTime"],
  "wms_weapon_type" => ["cn"],
  "wms_caliber" => ["cn"],
  "wms_country" => ["cn"],
  "wms_category" => ["cn"],
  "wms_status" => ["cn"]
}

template = <<-TEMPLATE
-ifndef(%{name_upper}_HRL).
-define(%{name_upper}_HRL, "%{name}_hrl").

-record(%{name}, {
    id = kvs:seq([],[]),
    next = [],
    prev = []%{fields}
}).

-endif.
TEMPLATE

def camel_to_snake(name)
  name.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
       gsub(/([a-z\d])([A-Z])/,'\1_\2').
       tr("-", "_").
       downcase
end

out_dir = "/Users/tonpa/depot/erpuno/wms/include"
FileUtils.mkdir_p(out_dir)

entities.each do |name, fields|
  field_lines = ""
  fields.each do |f|
    if f == "cn"
      field_lines += ",\n    cn = <<>>"
    else
      sn = camel_to_snake(f)
      field_lines += ",\n    #{sn} = <<>>"
    end
  end

  content = template % { name_upper: name.upcase, name: name, fields: field_lines }
  File.write(File.join(out_dir, "#{name}.hrl"), content)
end

puts "HRL files generated with Ruby."
