# Billing Execution Dashboard - November 2025 Usage

**Generated:** 2025-12-02  
**Billing Period:** November 2025  
**Execution Month:** December 2025

---

## Quick Reference

- **Total Scripts:** 44 commands (22 Preparation + 22 Printing)
- **Log Types:** 11 (I1A, M1B, M1C, M1F, M1G, M1R, M1U, M1V, M1A, A1A, A1U)
- **Script Files:**
  - `billing_preparation_scripts.sh` (Test + Live)
  - `billing_printing_scripts.sh` (Test + Live)

---

## Configuration Parameters

### ✅ Parameters Confirmed and Set:

#### Preparation Scripts
- **P4 (Late Payment Days):** `28` *(confirmed)*

#### Printing Scripts  
- **P6 (Billing Run UID):** `5000` *(confirmed from database)*

---

## Preparation Scripts Execution Tracker

### Test Mode (11 commands)

| Log Type | Status | Execution Time | Notes |
|----------|--------|----------------|-------|
| I1A | ⬜ Not Started | | |
| M1B | ⬜ Not Started | | |
| M1C | ⬜ Not Started | | |
| M1F | ⬜ Not Started | | |
| M1G | ⬜ Not Started | | |
| M1R | ⬜ Not Started | | |
| M1U | ⬜ Not Started | | |
| M1V | ⬜ Not Started | | |
| M1A | ⬜ Not Started | | |
| A1A | ⬜ Not Started | | |
| A1U | ⬜ Not Started | | |

### Live Mode (11 commands)

| Log Type | Status | Execution Time | Notes |
|----------|--------|----------------|-------|
| I1A | ⬜ Not Started | | |
| M1B | ⬜ Not Started | | |
| M1C | ⬜ Not Started | | |
| M1F | ⬜ Not Started | | |
| M1G | ⬜ Not Started | | |
| M1R | ⬜ Not Started | | |
| M1U | ⬜ Not Started | | |
| M1V | ⬜ Not Started | | |
| M1A | ⬜ Not Started | | |
| A1A | ⬜ Not Started | | |
| A1U | ⬜ Not Started | | |

---

## Printing Scripts Execution Tracker

### Test Mode (11 commands)

| Log Type | Status | Execution Time | Notes |
|----------|--------|----------------|-------|
| I1A | ⬜ Not Started | | |
| M1B | ⬜ Not Started | | |
| M1C | ⬜ Not Started | | |
| M1F | ⬜ Not Started | | |
| M1G | ⬜ Not Started | | |
| M1R | ⬜ Not Started | | |
| M1U | ⬜ Not Started | | |
| M1V | ⬜ Not Started | | |
| M1A | ⬜ Not Started | | |
| A1A | ⬜ Not Started | | |
| A1U | ⬜ Not Started | | |

### Live Mode (11 commands)

| Log Type | Status | Execution Time | Notes |
|----------|--------|----------------|-------|
| I1A | ⬜ Not Started | | |
| M1B | ⬜ Not Started | | |
| M1C | ⬜ Not Started | | |
| M1F | ⬜ Not Started | | |
| M1G | ⬜ Not Started | | |
| M1R | ⬜ Not Started | | |
| M1U | ⬜ Not Started | | |
| M1V | ⬜ Not Started | | |
| M1A | ⬜ Not Started | | |
| A1A | ⬜ Not Started | | |
| A1U | ⬜ Not Started | | |

---

## Status Legend

- ⬜ Not Started
- 🟡 In Progress
- ✅ Completed Successfully
- ❌ Failed
- ⏭️ Skipped

---

## Execution Workflow

### Recommended Order:

1. **Update Configuration Parameters**
   - Set `LATE_PAYMENT_DAYS` in `billing_preparation_scripts.sh`
   - Set `BILLING_RUN_UID` in `billing_printing_scripts.sh`

2. **Run Test Scripts First**
   - Execute Preparation Test scripts
   - Verify outputs in log files
   - Execute Printing Test scripts
   - Verify billing output

3. **Review Test Results**
   - Check log files in `/cer_cerprod/log/`
   - Validate billing calculations
   - Confirm all 11 log types processed

4. **Run Live Scripts (After Test Validation)**
   - Execute Preparation Live scripts
   - Execute Printing Live scripts
   - Monitor execution closely

5. **Update Dashboard**
   - Mark completed commands with ✅
   - Note execution times
   - Document any issues in Notes column

---

## Log File Locations

- **Preparation Logs:** `/cer_cerprod/log/test_bill_02122025_{LOG_TYPE}.log`
- **Printing Logs:** `/cer_cerprod/log/test_bill_Print_02122025_{LOG_TYPE}.log`

---

## Troubleshooting

### Common Issues:
1. **Missing Billing Run UID:** Query database for correct value
2. **Late Payment Days:** Confirm business rules (typically 28-31 days)
3. **Log File Permissions:** Ensure write access to log directory
4. **Database Connection:** Verify connectivity before running scripts

### Validation Queries:
```sql
-- Get Billing Run UID
SELECT prime_uid, run_date, status FROM billing_runs 
WHERE run_date >= '2025-11-01' AND run_date < '2025-12-01'
ORDER BY run_date DESC;

-- Verify bill counts
SELECT bill_class_code, COUNT(*) FROM bills 
WHERE billing_run_uid = {BILLING_RUN_UID}
GROUP BY bill_class_code;
```

---

## Notes

- **Billing Cycle:** November usage billed in December
- **Collection Start:** December 2, 2025
- **Payment Due:** December 31, 2025
- **Late Charges:** Applied after configured days (P4 parameter)

### Important Dates:
- **Usage Period:** November 1-30, 2025
- **Bill Generation:** December 2, 2025
- **Bill To Date:** December 1, 2025 00:00:00
- **Due Date:** December 31, 2025 23:59:59

---

*Last Updated: 2025-12-02*
