#!/bin/bash
PV="proverif"
MODLE="../../model/reachability/Per-pairing_peripheral_passive.pv"
title="per-pairing-peripheral-passive-tracker"

prepare () {
	outdir="results/$title/$1"
	mkdir -p $outdir
	TMP="$outdir/model.pv"
	out_f="$outdir/output.txt"
	options="-html $outdir"
}

analyze () {
	{ time $PV $options $TMP; } 2>&1 | tee $out_f | grep "^Query"
	echo ""
}

prepare "Never-7-P1"
echo "1. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLENEVERPK $MODLE > $TMP
analyze

prepare "Never-8-9-P1"
echo "2. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLENEVERIRK $MODLE > $TMP
analyze

prepare "Never-10-P1"
echo "3. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLENEVERLTK $MODLE > $TMP
analyze

prepare "Never-11-P1"
echo "4. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLENEVERCSRK $MODLE > $TMP
analyze

prepare "Never-12-P1"
echo "5. Verify whether a NEVER paired passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLENEVERID $MODLE > $TMP
analyze

prepare "Paired-21-22-23-P1"
echo "6. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLEPAIREDPK $MODLE > $TMP
analyze

prepare "Paired-24-P1"
echo "7. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEPAIREDIRK $MODLE > $TMP
analyze

prepare "Paired-25-P1"
echo "8. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEPAIREDIRK -DFIXSCAN $MODLE > $TMP
analyze

prepare "Paired-26-P1"
echo "9. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLEPAIREDLTK $MODLE > $TMP
analyze

prepare "Paired-27-P1"
echo "10. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEPAIREDCSRK $MODLE > $TMP
analyze

prepare "Paired-28-P1"
echo "11. Verify whether a currently PAIRED passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEPAIREDID $MODLE > $TMP
analyze

prepare "Unpaired-37-38-39-P1"
echo "12. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLEUNPAIREDPK $MODLE > $TMP
analyze

prepare "Unpaired-40-41-P1"
echo "13. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEUNPAIREDIRK $MODLE > $TMP
analyze

prepare "Unpaired-42-P1"
echo "14. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLEUNPAIREDLTK $MODLE > $TMP
analyze

prepare "Unpaired-43-P1"
echo "15. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEUNPAIREDCSRK $MODLE > $TMP
analyze

prepare "Unpaired-44-P1"
echo "16. Verify whether an UNPAIRED passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEUNPAIREDID $MODLE > $TMP
analyze