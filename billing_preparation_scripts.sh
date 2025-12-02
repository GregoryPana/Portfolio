#!/bin/bash
################################################################################
# BILLING PREPARATION SCRIPTS - NOVEMBER 2025 USAGE
# Generated: 2025-12-02
# Execution Period: December 2025 (for November usage)
################################################################################

# PARAMETERS CONFIRMED FOR NOVEMBER 2025 BILLING
# P4 = Late Payment Charge Start Days
LATE_PAYMENT_DAYS="28"  # Confirmed: 28 days

# Log Types: I1A, M1B, M1C, M1F, M1G, M1R, M1U, M1V, M1A, A1A, A1U
LOG_TYPES=("I1A" "M1B" "M1C" "M1F" "M1G" "M1R" "M1U" "M1V" "M1A" "A1A" "A1U")

################################################################################
# PREPARATION SCRIPTS - TEST MODE
################################################################################

echo "================================================"
echo "PREPARATION SCRIPTS - TEST MODE"
echo "Collection Plan Start Date: 2025_12_02 00:00:00"
echo "Late Payment Charge Days: ${LATE_PAYMENT_DAYS}"
echo "================================================"
echo ""

# Test Mode Scripts (P2='T')
for LOG_TYPE in "${LOG_TYPES[@]}"; do
    echo "# ${LOG_TYPE} - Test"
    echo "P1='${LOG_TYPE}' P2='T' P3='2025_12_02 00:00:00' P4='${LATE_PAYMENT_DAYS}' P5='2' P6='' P7='' P8='' /cer_cerprod/exe/pspbil0101b.sh | tee /cer_cerprod/log/test_bill_02122025_${LOG_TYPE}.log"
    echo ""
done

echo ""
echo "================================================"

################################################################################
# PREPARATION SCRIPTS - LIVE MODE
################################################################################

echo "================================================"
echo "PREPARATION SCRIPTS - LIVE MODE"
echo "Collection Plan Start Date: 2025_12_02 00:00:00"
echo "Late Payment Charge Days: ${LATE_PAYMENT_DAYS}"
echo "================================================"
echo ""

# Live Mode Scripts (P2='N')
for LOG_TYPE in "${LOG_TYPES[@]}"; do
    echo "# ${LOG_TYPE} - Live"
    echo "P1='${LOG_TYPE}' P2='N' P3='2025_12_02 00:00:00' P4='${LATE_PAYMENT_DAYS}' P5='2' P6='' P7='' P8='' /cer_cerprod/exe/pspbil0101b.sh | tee /cer_cerprod/log/test_bill_02122025_${LOG_TYPE}.log"
    echo ""
done

echo ""
echo "================================================"
echo "Total Commands Generated: 22 (11 Test + 11 Live)"
echo "================================================"

################################################################################
# PARAMETER REFERENCE
################################################################################
# P1 = LOG_TYPE (cycles through all 11 log types)
# P2 = 'T' (Test) or 'N' (Live)
# P3 = Collection Plan Start Date: 2025_12_02 00:00:00
# P4 = Late Payment Charge Start Days: ${LATE_PAYMENT_DAYS} (configurable)
# P5 = 2 (Grace Period - default)
# P6 = '' (empty - default)
# P7 = '' (empty - default)
# P8 = '' (empty - default)
################################################################################
