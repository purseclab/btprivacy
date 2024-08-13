#!/bin/bash

echo "Reproduce the results in Table 6. It may take up to 2 hours to finish."
sleep 3

sh ./reachability/per-device_central_active_tracker.sh
echo ""

sh ./reachability/per-device_central_passive_tracker.sh
echo ""

sh ./reachability/per-device_peripheral_active_tracker.sh
echo ""

sh ./reachability/per-device_peripheral_passive_tracker.sh
echo ""

sh ./reachability/per-pairing_central_active_tracker.sh
echo ""

sh ./reachability/per-pairing_central_passive_tracker.sh
echo ""

sh ./reachability/per-pairing_peripheral_active_tracker.sh
echo ""

sh ./reachability/per-pairing_peripheral_passive_tracker.sh
echo ""
