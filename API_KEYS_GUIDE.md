# API Keys Configuration Guide

## 📍 Where API Keys Are Used

This project uses **3 main API keys** that need to be configured:

---

## 1. 🔑 Google Gemini API Key (Backend)

### **Location:** `server/.env` file

### **Variable Name:** `GEMINI_API_KEY`

### **Used In:**
- `server/controllers/ChatBot.js` - AI Chatbot functionality
- `server/controllers/ReportAnalyzer.js` - Medical report analysis
- `server/controllers/ChatbotSummarizer.js` - Health summary generation
- `server/controllers/PatientDataSummaizer.js` - Patient data summarization

### **How to Get:**
1. Go to https://aistudio.google.com/app/apikey
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the API key

### **Add to `.env` file:**
```env
GEMINI_API_KEY=your_gemini_api_key_here
```

---

## 2. 🔑 Pinata JWT Token (Frontend - IPFS)

### **Location:** `frontent/.env` file

### **Variable Name:** `VITE_PINATA_JWT`

### **Used In:**
- `frontent/src/assets/uploadToPinata.js` - File uploads to IPFS

### **How to Get:**
1. Go to https://app.pinata.cloud/
2. Sign up/Login
3. Go to "API Keys" section
4. Click "New Key"
5. Copy the JWT token

### **Add to `.env` file:**
```env
VITE_PINATA_JWT=your_pinata_jwt_token_here
```

---

## 3. 🔑 JWT Secret (Backend - Authentication)

### **Location:** `server/.env` file

### **Variable Name:** `JWT_SECRET`

### **Used In:**
- `server/Utils/jwt.js` - Token generation
- `server/middlewares/auth.js` - Token verification

### **How to Generate:**
You can use any random string. For example:
- Use an online generator: https://randomkeygen.com/
- Or generate: `openssl rand -base64 32`

### **Add to `.env` file:**
```env
JWT_SECRET=your_random_secret_key_here
```

---

## 📁 Complete .env File Examples

### **`server/.env`** (Backend)
```env
# MongoDB Connection
mongoURI=mongodb://localhost:27017/healthcare
# OR for MongoDB Atlas:
# mongoURI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority

# Server Port
PORT=5000

# Google Gemini API Key (Required for AI features)
GEMINI_API_KEY=your_gemini_api_key_here

# JWT Secret (Required for authentication)
JWT_SECRET=your_random_secret_key_here
```

### **`frontent/.env`** (Frontend)
```env
# Ganache Network Configuration
VITE_GANACHE_URL=http://127.0.0.1:7545

# Smart Contract Addresses (After running truffle migrate)
VITE_PATIENT_CONTRACT_ADDRESS=0x...
VITE_DOCTOR_CONTRACT_ADDRESS=0x...
VITE_DIAGNOSIS_CONTRACT_ADDRESS=0x...

# Backend API URL
VITE_BACKEND_URL=http://localhost:5000

# Pinata IPFS JWT Token (Required for file uploads)
VITE_PINATA_JWT=your_pinata_jwt_token_here
```

---

## ⚠️ Important Notes

1. **Never commit `.env` files to Git** - They're already in `.gitignore`
2. **Keep API keys secure** - Don't share them publicly
3. **Restart server after adding keys** - Changes require server restart
4. **Frontend keys must start with `VITE_`** - Vite only exposes variables prefixed with `VITE_`

---

## 🔍 Where Each Key Is Used

### Gemini API Key (`GEMINI_API_KEY`)
- ✅ ChatBot responses
- ✅ Medical report analysis
- ✅ Health summary generation
- ✅ Patient data summarization

### Pinata JWT (`VITE_PINATA_JWT`)
- ✅ Uploading medical records to IPFS
- ✅ Uploading prescriptions
- ✅ Uploading diagnosis reports

### JWT Secret (`JWT_SECRET`)
- ✅ User authentication tokens
- ✅ Session management

---

## 🚀 Quick Setup Checklist

- [ ] Create `server/.env` file
- [ ] Add `GEMINI_API_KEY` (get from Google AI Studio)
- [ ] Add `JWT_SECRET` (generate random string)
- [ ] Add `mongoURI` (MongoDB connection string)
- [ ] Create `frontent/.env` file
- [ ] Add `VITE_PINATA_JWT` (get from Pinata)
- [ ] Add contract addresses (after migration)
- [ ] Restart both frontend and backend servers

---

## 📝 Need Help?

- **Gemini API:** https://aistudio.google.com/app/apikey
- **Pinata:** https://app.pinata.cloud/
- **JWT Secret:** Use any secure random string

