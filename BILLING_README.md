# Billing Scripts for November 2025 Usage

This directory contains billing scripts for processing November 2025 usage, executed in December 2025.

## Generated Files

1. **`billing_preparation_scripts.sh`** - Preparation scripts (Test + Live modes)
2. **`billing_printing_scripts.sh`** - Printing scripts (Test + Live modes)
3. **`billing_execution_dashboard.md`** - Execution tracking dashboard

## Parameters Confirmed

- **P4 (Late Payment Days):** 28 days
- **P6 (Billing Run UID):** 5000

## Quick Start

### 1. Generate Preparation Commands

```bash
# View all preparation commands (Test + Live)
bash billing_preparation_scripts.sh

# Save to file for execution
bash billing_preparation_scripts.sh > prep_commands.txt
```

### 2. Generate Printing Commands

```bash
# View all printing commands (Test + Live)
bash billing_printing_scripts.sh

# Save to file for execution
bash billing_printing_scripts.sh > print_commands.txt
```

### 3. Execute Commands

**Option A: Copy-paste individual commands**
- Run scripts to display commands
- Copy and execute each command individually
- Update dashboard after each execution

**Option B: Save and execute in batch**
```bash
# Save commands
bash billing_preparation_scripts.sh > prep_commands.txt
bash billing_printing_scripts.sh > print_commands.txt

# Execute (after reviewing)
bash prep_commands.txt
bash print_commands.txt
```

## Script Structure

### Preparation Scripts (22 commands)
- **11 Test Mode** commands (P2='T')
- **11 Live Mode** commands (P2='N')
- All log types: I1A, M1B, M1C, M1F, M1G, M1R, M1U, M1V, M1A, A1A, A1U

### Printing Scripts (22 commands)
- **11 Test Mode** commands (P2='PBCC=LOG_TYPE|PITM=Y|PTEST=Y')
- **11 Live Mode** commands (P2='PBCC=LOG_TYPE|PITM=Y|PTEST=N')
- All log types: I1A, M1B, M1C, M1F, M1G, M1R, M1U, M1V, M1A, A1A, A1U

## Execution Dashboard

Track your progress using `billing_execution_dashboard.md`:
- ✅ Mark completed commands
- 🟡 Track in-progress items
- ❌ Note failures
- Add execution times and notes

## Key Dates

- **Usage Period:** November 1-30, 2025
- **Bill Generation:** December 2, 2025
- **Collection Start:** December 2, 2025 00:00:00
- **Bill To Date:** December 1, 2025 00:00:00
- **Payment Due:** December 31, 2025 23:59:59
- **Late Charges:** Applied after 28 days

## Log Files

All execution logs are saved to:
- Preparation: `/cer_cerprod/log/test_bill_02122025_{LOG_TYPE}.log`
- Printing: `/cer_cerprod/log/test_bill_Print_02122025_{LOG_TYPE}.log`

## Recommended Workflow

1. **Run Test Scripts First**
   - Execute all 11 Test mode Preparation commands
   - Verify logs and outputs
   - Execute all 11 Test mode Printing commands
   - Validate billing results

2. **Review Test Results**
   - Check log files for errors
   - Validate billing calculations
   - Confirm all log types processed correctly

3. **Run Live Scripts**
   - After test validation, execute Live mode commands
   - Monitor execution closely
   - Update dashboard in real-time

4. **Post-Execution Verification**
   - Review all log files
   - Confirm billing data in database
   - Update final status in dashboard

## Support

For parameter explanations or issues:
- Review parameter reference sections in each script file
- Check troubleshooting section in `billing_execution_dashboard.md`
- Validate database connectivity and billing run UID

---

**Generated:** 2025-12-02  
**Billing Period:** November 2025  
**Total Commands:** 44 (22 Preparation + 22 Printing)
