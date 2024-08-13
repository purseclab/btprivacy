#!/bin/bash

echo "Reproduce the results in Table 7."
sleep 3

sh ./observational_equivalence/per-device_central_active_tracker.sh
echo ""

sh ./observational_equivalence/per-device_central_passive_tracker.sh
echo ""

sh ./observational_equivalence/per-device_peripheral_active_tracker.sh
echo ""

sh ./observational_equivalence/per-device_peripheral_passive_tracker.sh
echo ""
