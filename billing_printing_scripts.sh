#!/bin/bash
################################################################################
# BILLING PRINTING SCRIPTS - NOVEMBER 2025 USAGE
# Generated: 2025-12-02
# Execution Period: December 2025 (for November usage)
################################################################################

# PARAMETERS CONFIRMED FOR NOVEMBER 2025 BILLING
# P6 = Billing Run UID from bill_history table (prime_uid of billing_runs)
# For test billing, use the billing_run_uid from test schema
BILLING_RUN_UID="5000"  # Confirmed: UID 5000

# Log Types: I1A, M1B, M1C, M1F, M1G, M1R, M1U, M1V, M1A, A1A, A1U
LOG_TYPES=("I1A" "M1B" "M1C" "M1F" "M1G" "M1R" "M1U" "M1V" "M1A" "A1A" "A1U")

################################################################################
# PRINTING SCRIPTS - TEST MODE
################################################################################

echo "================================================"
echo "PRINTING SCRIPTS - TEST MODE"
echo "Bill To Date: 2025_12_01 00:00:00"
echo "Bill Due Date: 2025_12_31 23:59:59"
echo "Billing Run UID: ${BILLING_RUN_UID}"
echo "================================================"
echo ""

# Test Mode Scripts (P2='PBCC=LOG_TYPE|PITM=Y|PTEST=Y')
for LOG_TYPE in "${LOG_TYPES[@]}"; do
    echo "# ${LOG_TYPE} - Test"
    echo "P1='S' P2='PBCC=${LOG_TYPE}|PITM=Y|PTEST=Y' P3='2025_12_01 00:00:00' P4='2025_12_31 23:59:59' P5='N' P6='${BILLING_RUN_UID}' P7='0' P8='99999999' /cer_cerprod/exe/bil0705s.sh | tee /cer_cerprod/log/test_bill_Print_02122025_${LOG_TYPE}.log"
    echo ""
done

echo ""
echo "================================================"

################################################################################
# PRINTING SCRIPTS - LIVE MODE
################################################################################

echo "================================================"
echo "PRINTING SCRIPTS - LIVE MODE"
echo "Bill To Date: 2025_12_01 00:00:00"
echo "Bill Due Date: 2025_12_31 23:59:59"
echo "Billing Run UID: ${BILLING_RUN_UID}"
echo "================================================"
echo ""

# Live Mode Scripts (P2='PBCC=LOG_TYPE|PITM=Y|PTEST=N')
for LOG_TYPE in "${LOG_TYPES[@]}"; do
    echo "# ${LOG_TYPE} - Live"
    echo "P1='S' P2='PBCC=${LOG_TYPE}|PITM=Y|PTEST=N' P3='2025_12_01 00:00:00' P4='2025_12_31 23:59:59' P5='N' P6='${BILLING_RUN_UID}' P7='0' P8='99999999' /cer_cerprod/exe/bil0705s.sh | tee /cer_cerprod/log/test_bill_Print_02122025_${LOG_TYPE}.log"
    echo ""
done

echo ""
echo "================================================"
echo "Total Commands Generated: 22 (11 Test + 11 Live)"
echo "================================================"

################################################################################
# PARAMETER REFERENCE
################################################################################
# P1 = 'S' (Operation - default)
# P2 = 'PBCC=LOG_TYPE|PITM=Y|PTEST=Y' (Test) or 'PBCC=LOG_TYPE|PITM=Y|PTEST=N' (Live)
# P3 = Bill To Date: 2025_12_01 00:00:00 (start of December for November usage)
# P4 = Bill Due Date: 2025_12_31 23:59:59 (end of December)
# P5 = 'N' (Disconnection - default)
# P6 = ${BILLING_RUN_UID} (Billing run UID from database - configurable)
# P7 = 0 (starting account - default)
# P8 = 99999999 (ending account - default)
################################################################################
