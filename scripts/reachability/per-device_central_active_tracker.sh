#!/bin/bash
PV="proverif"
MODLE="../../model/reachability/Per-device_central_active.pv"
title="per-device-central-active-tracker"

prepare () {
	outdir="results/$title/$1"
	mkdir -p $outdir
	TMP="$outdir/model.pv"
	out_f="$outdir/output.txt"
	options="-html $outdir"
}

analyze () {
	{ time $PV $options $TMP; } 2>&1 | tee $out_f |grep "^Query"
	echo ""
}

prepare "Never-1-P2"
echo "1. Verify whether a NEVER paired active tracker can track the BLE-only vicitm device using the public key"
m4 -DBLENEVERPK $MODLE > $TMP
analyze

prepare "Never-2-3-P2"
echo "2. Verify whether a NEVER paired active tracker can track the BLE-only vicitm device using IRK"
m4 -DBLENEVERIRK $MODLE > $TMP
analyze

prepare "Never-4-P2"
echo "3. Verify whether a NEVER paired active tracker can track the BLE-only vicitm device using LTK"
m4 -DBLENEVERLTK $MODLE > $TMP
analyze

prepare "Never-5-P2"
echo "4. Verify whether a NEVER paired active tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLENEVERCSRK $MODLE > $TMP
analyze

prepare "Never-6-P2"
echo "5. Verify whether a NEVER paired active tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLENEVERID $MODLE > $TMP
analyze

prepare "Paired-13-P2"
echo "6. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using the IRK (pairing)"
m4 -DBLEPAIREDPK -DPKIRK $MODLE > $TMP
analyze

prepare "Paired-14-P2"
echo "7. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using the CSRK (pairing)"
m4 -DBLEPAIREDPK -DPKCSRK $MODLE > $TMP
analyze

prepare "Paired-15-P2"
echo "8. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using the ID_ADDR (pairing)"
m4 -DBLEPAIREDPK -DPKIDADDR $MODLE > $TMP
analyze

prepare "Paired-16-P2"
echo "9. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using IRK (active scanning)"
m4 -DBLEPAIREDIRK -DFIXCONN $MODLE > $TMP
analyze

prepare "Paired-17-P2"
echo "10. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEPAIREDIRK $MODLE > $TMP
analyze

prepare "Paired-18-P2"
echo "11. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using LTK"
m4 -DBLEPAIREDLTK $MODLE > $TMP
analyze

prepare "Paired-19-P2"
echo "12. Verify whether a PAIRED active tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEPAIREDCSRK $MODLE > $TMP
analyze

prepare "Paired-20-P2"
echo "13. Verify whether a PAIRED active tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEPAIREDID $MODLE > $TMP
analyze

prepare "Unpaired-29-P2"
echo "14. Verify whether an UNPAIRED active tracker can track the BLE-only vicitm device using the IRK (pairing)"
m4 -DBLEUNPAIREDPK -DPKIRK $MODLE > $TMP
analyze

prepare "Unpaired-30-P2"
echo "15. Verify whether an UNPAIRED active tracker can track the BLE-only vicitm device using the CSRK (pairing)"
m4 -DBLEUNPAIREDPK -DPKCSRK $MODLE > $TMP
analyze

prepare "Unpaired-31-P2"
echo "16. Verify whether an UNPAIRED active tracker can track the BLE-only vicitm device using the ID_ADDR (pairing)"
m4 -DBLEUNPAIREDPK -DPKIDADDR $MODLE > $TMP
analyze

prepare "Unpaired-32-P2"
echo "17. Verify whether an UNPAIRED active attacker can track the BLE-only vicitm device using IRK (active scanning)"
m4 -DBLEUNPAIREDIRK -DFIXCONN $MODLE > $TMP
analyze

prepare "Unpaired-33-P2"
echo "18. Verify whether an UNPAIRED active attacker can track the BLE-only vicitm device using IRK"
m4 -DBLEUNPAIREDIRK $MODLE > $TMP
analyze

prepare "Unpaired-34-P2"
echo "19. Verify whether an UNPAIRED active attacker can track the BLE-only vicitm device using LTK"
m4 -DBLEUNPAIREDLTK $MODLE > $TMP
analyze

prepare "Unpaired-35-P2"
echo "20. Verify whether an UNPAIRED active attacker can track the BLE-only vicitm device using CSRK"
m4 -DBLEUNPAIREDCSRK $MODLE > $TMP
analyze

prepare "Unpaired-36-P2"
echo "21. Verify whether an UNPAIRED active attacker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEUNPAIREDID $MODLE > $TMP
analyze