#!/bin/bash
PV="proverif"
MODLE="../../model/observational_equivalence/Per-device_peripheral_passive.pv"
title="per-device-peripheral-passive-tracker"

prepare () {
	outdir="results/$title/$1"
	mkdir -p $outdir
	TMP="$outdir/model.pv"
	out_f="$outdir/output.txt"
	options="-html $outdir"
}

analyze () {
	# { time $PV $options $TMP; } 2>&1 | tee $out_f | grep "^RESULT"
	{ time $PV $options $TMP; } 2>&1 | tee $out_f
	echo ""
}

prepare "Never-1-PK"
echo "1. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using the public key (false attack)"
m4 -DBLENEVERPK -DPK $MODLE > $TMP
analyze

prepare "Never-2-IRK"
echo "2. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLENEVERIRK -DIRK $MODLE > $TMP
analyze

prepare "Never-3-LTK"
echo "3. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using LTK (false attack)"
m4 -DBLENEVERLTK -DLTK $MODLE > $TMP
analyze

prepare "Never-4-CSRK"
echo "4. Verify whether a NEVER paired passive tracker can track the BLE-only vicitm device using CSRK (false attack)"
m4 -DBLENEVERCSRK -DCSRK $MODLE > $TMP
analyze

prepare "Never-5-ADDR"
echo "5. Verify whether a NEVER paired passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLENEVERID -DID $MODLE > $TMP
analyze

prepare "Paired-6-PK"
echo "6. Verify whether a PAIRED passive tracker can track the BLE-only vicitm device using the public key (false attack)"
m4 -DBLEPAIREDPK -DPK $MODLE > $TMP
analyze

prepare "Paired-7-IRK"
echo "7. Verify whether a PAIRED passive tracker can track the BLE-only vicitm device using IRK"
m4 -DBLEPAIREDIRK -DIRK $MODLE > $TMP
analyze

prepare "Paired-8-LTK"
echo "8. Verify whether a PAIRED passive tracker can track the BLE-only vicitm device using LTK (false attack)"
m4 -DBLEPAIREDLTK -DLTK $MODLE > $TMP
analyze

prepare "Paired-9-CSRK"
echo "9. Verify whether a PAIRED passive tracker can track the BLE-only vicitm device using CSRK"
m4 -DBLEPAIREDCSRK -DCSRK $MODLE > $TMP
analyze

prepare "Paired-10-ADDR"
echo "10. Verify whether a PAIRED passive tracker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEPAIREDID -DID $MODLE > $TMP
analyze

prepare "Unpaired-11-PK"
echo "11. Verify whether an UNPAIRED passive attacker can track the BLE-only vicitm device using the public key (false attack)"
m4 -DBLEUNPAIREDPK -DPK $MODLE > $TMP
analyze

prepare "Unpaired-12-IRK"
echo "12. Verify whether an UNPAIRED passive attacker can track the BLE-only vicitm device using IRK"
m4 -DBLEUNPAIREDIRK -DIRK $MODLE > $TMP
analyze

prepare "Unpaired-13-LTK"
echo "13. Verify whether an UNPAIRED passive attacker can track the BLE-only vicitm device using LTK (false attack)"
m4 -DBLEUNPAIREDLTK -DLTK $MODLE > $TMP
analyze

prepare "Unpaired-14-CSRK"
echo "14. Verify whether an UNPAIRED passive attacker can track the BLE-only vicitm device using CSRK"
m4 -DBLEUNPAIREDCSRK -DCSRK $MODLE > $TMP
analyze

prepare "Unpaired-15-ADDR"
echo "15. Verify whether an UNPAIRED passive attacker can track the BC/BLE vicitm device using the identity address (ID_ADDR)"
m4 -DBCBLEUNPAIREDID -DID $MODLE > $TMP
analyze