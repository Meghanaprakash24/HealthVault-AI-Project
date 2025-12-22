# Environment Variables Setup Guide

## Step 1: Create `.env` file

Create a file named `.env` in the `frontent` directory (same folder as this file).

## Step 2: Run Truffle Migration

```bash
truffle compile
truffle migrate --reset
```

After running the migration, you'll see output like this:

```
1_deploy_migrate.js
===================
   Deploying 'PatientRegistration'
   -------------------------------
   > transaction hash:    0x...
   > Blocks: 0            Seconds: 0
   > contract address:    0x1234567890abcdef1234567890abcdef12345678  👈 COPY THIS
   ...

2_deploy_migrate.js
===================
   Deploying 'DoctorRegistration'
   -------------------------------
   > transaction hash:    0x...
   > Blocks: 0            Seconds: 0
   > contract address:    0xabcdef1234567890abcdef1234567890abcdef12  👈 COPY THIS
   ...

3_deploy_migrate.js
===================
   Deploying 'DiagnosisRegistration'
   --------------------------------
   > transaction hash:    0x...
   > Blocks: 0            Seconds: 0
   > contract address:    0x9876543210fedcba9876543210fedcba98765432  👈 COPY THIS
   ...
```

## Step 3: Copy Addresses to `.env` file

Create/Edit `.env` file in the `frontent` directory with the following content:

```env
# Ganache Network Configuration
VITE_GANACHE_URL=http://127.0.0.1:7545

# Smart Contract Addresses (Replace with addresses from truffle migrate output)
VITE_PATIENT_CONTRACT_ADDRESS=0x1234567890abcdef1234567890abcdef12345678
VITE_DOCTOR_CONTRACT_ADDRESS=0xabcdef1234567890abcdef1234567890abcdef12
VITE_DIAGNOSIS_CONTRACT_ADDRESS=0x9876543210fedcba9876543210fedcba98765432

# Backend API URL
VITE_BACKEND_URL=http://localhost:5000

# Pinata IPFS Configuration (Get from https://app.pinata.cloud/ipfs/files)
VITE_PINATA_JWT=your_pinata_jwt_token_here
```

**Replace the addresses above with the actual addresses from your `truffle migrate` output!**

## Important Notes:

- **DO NOT** modify the migration files (`1_deploy_migrate.js`, `2_deploy_migrate.js`, `3_deploy_migrate.js`)
- **DO** copy the contract addresses from the terminal output after running `truffle migrate`
- **DO** paste them into the `.env` file
- The addresses are used by `src/context/Web3Context.jsx` (lines 16-18)

## File Location:

```
Arogya_personal-main/
└── frontent/
    ├── .env                    ← CREATE THIS FILE HERE
    ├── migrations/
    │   ├── 1_deploy_migrate.js  ← DON'T MODIFY (deploys PatientRegistration)
    │   ├── 2_deploy_migrate.js  ← DON'T MODIFY (deploys DoctorRegistration)
    │   └── 3_deploy_migrate.js  ← DON'T MODIFY (deploys DiagnosisRegistration)
    └── src/
        └── context/
            └── Web3Context.jsx  ← READS addresses from .env file
```

