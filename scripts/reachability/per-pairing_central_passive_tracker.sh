#!/bin/bash
PV="proverif"
MODLE="../../model/reachability/Per-pairing_central_passive.pv"
title="per-pairing-central-passive-tracker"

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

prepare "Never-1-P1"
echo "1. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLENEVERPK $MODLE > $TMP
analyze

prepare "Never-2-3-P1"
echo "2. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLENEVERIRK $MODLE > $TMP
analyze

prepare "Never-4-P1"
echo "3. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLENEVERLTK $MODLE > $TMP
analyze

prepare "Never-5-P1"
echo "4. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLENEVERCSRK $MODLE > $TMP
analyze

prepare "Never-6-P1"
echo "5. Verify whether a NEVER paired passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLENEVERID $MODLE > $TMP
analyze

prepare "Paired-13-14-15-P1"
echo "6. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLEPAIREDPK $MODLE > $TMP
analyze

prepare "Paired-16-17-P1"
echo "7. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEPAIREDIRK $MODLE > $TMP
analyze

prepare "Paired-18-P1"
echo "8. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLEPAIREDLTK $MODLE > $TMP
analyze

prepare "Paired-19-P1"
echo "9. Verify whether a currently PAIRED passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEPAIREDCSRK $MODLE > $TMP
analyze

prepare "Paired-20-P1"
echo "10. Verify whether a currently PAIRED passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBLEPAIREDID $MODLE > $TMP
analyze

prepare "Unpaired-29-30-31-P1"
echo "11. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using the public key"
m4 -DBLEUNPAIREDPK $MODLE > $TMP
analyze

prepare "Unpaired-32-33-P1"
echo "12. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEUNPAIREDIRK $MODLE > $TMP
analyze

prepare "Unpaired-34-P1"
echo "13. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using LTK"
m4 -DBLEUNPAIREDLTK $MODLE > $TMP
analyze

prepare "Unpaired-35-P1"
echo "14. Verify whether an UNPAIRED passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEUNPAIREDCSRK $MODLE > $TMP
analyze

prepare "Unpaired-36-P1"
echo "15. Verify whether an UNPAIRED passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEUNPAIREDID $MODLE > $TMP
analyze