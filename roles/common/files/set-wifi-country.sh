#!/bin/sh
list_wlan_interfaces() {
  for dir in /sys/class/net/*/wireless; do
    if [ -d "$dir" ]; then
      basename "$(dirname "$dir")"
    fi
  done
}
IFACE="$(list_wlan_interfaces)"
COUNTRY="US"
echo "Setting country to $COUNTRY on $IFACE"
wpa_cli -i "$IFACE" set country "$COUNTRY"
wpa_cli -i "$IFACE" save_config > /dev/null 2>&1
