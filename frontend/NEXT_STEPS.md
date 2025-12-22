# Next Steps After Creating Ganache Workspace

## ✅ Step 1: Verify Ganache is Running
- Make sure Ganache workspace is running
- Check that Chain ID shows **5777** (not 1337)
- Port should be **7545**

## ✅ Step 2: Compile and Deploy Contracts

Open terminal in the `frontent` directory and run:

```bash
truffle compile
truffle migrate --reset
```

**Important:** Copy the contract addresses from the terminal output! You'll see something like:

```
1_deploy_migrate.js
===================
   Deploying 'PatientRegistration'
   -------------------------------
   > contract address:    0x1234567890abcdef1234567890abcdef12345678  👈 COPY THIS

2_deploy_migrate.js
===================
   Deploying 'DoctorRegistration'
   -------------------------------
   > contract address:    0xabcdef1234567890abcdef1234567890abcdef12  👈 COPY THIS

3_deploy_migrate.js
===================
   Deploying 'DiagnosisRegistration'
   --------------------------------
   > contract address:    0x9876543210fedcba9876543210fedcba98765432  👈 COPY THIS
```

## ✅ Step 3: Create .env File

Create a file named `.env` in the `frontent` directory with:

```env
# Ganache Network Configuration
VITE_GANACHE_URL=http://127.0.0.1:7545

# Smart Contract Addresses (Replace with addresses from Step 2)
VITE_PATIENT_CONTRACT_ADDRESS=0x1234567890abcdef1234567890abcdef12345678
VITE_DOCTOR_CONTRACT_ADDRESS=0xabcdef1234567890abcdef1234567890abcdef12
VITE_DIAGNOSIS_CONTRACT_ADDRESS=0x9876543210fedcba9876543210fedcba98765432

# Backend API URL
VITE_BACKEND_URL=http://localhost:5000

# Pinata IPFS Configuration (Get from https://app.pinata.cloud/ipfs/files)
VITE_PINATA_JWT=your_pinata_jwt_token_here
```

**Replace the contract addresses with the actual ones from Step 2!**

## ✅ Step 4: Configure MetaMask

1. Open MetaMask extension
2. Click network dropdown → "Add Network" or "Add a network manually"
3. Enter these settings:
   - **Network Name:** `Ganache Local`
   - **New RPC URL:** `http://127.0.0.1:7545`
   - **Chain ID:** `5777` ⚠️ Important!
   - **Currency Symbol:** `ETH`
   - **Block Explorer URL:** (leave blank)
4. Click "Save"

## ✅ Step 5: Add Ganache Account to MetaMask

1. In Ganache, click the key icon 🔑 next to any account
2. Copy the **Private Key**
3. In MetaMask:
   - Click account icon → "Import Account"
   - Paste the private key
   - Click "Import"

## ✅ Step 6: Get Pinata JWT (for IPFS)

1. Go to https://app.pinata.cloud/
2. Sign up/Login
3. Go to API Keys section
4. Create a new API key
5. Copy the JWT token
6. Paste it in your `.env` file as `VITE_PINATA_JWT`

## ✅ Step 7: Run the Frontend

```bash
cd frontent
npm run dev
```

## ✅ Step 8: Run the Backend (in a separate terminal)

```bash
cd server
npm install  # if not done already
npm start
```

## ✅ Step 9: Test the Application

1. Open browser to the frontend URL (usually http://localhost:5173)
2. Connect MetaMask
3. Select the Ganache Local network
4. Test registration/login functionality

---

## Troubleshooting

- **MetaMask Chain ID error:** Make sure Chain ID is exactly `5777` (not 1337)
- **Contract not found:** Check that `.env` file has correct contract addresses
- **Connection error:** Verify Ganache is running on port 7545
- **No accounts:** Make sure you imported a Ganache account to MetaMask

