# MongoDB Setup Guide

## Problem: MongoDB Connection Refused

This means MongoDB is not running or not accessible. Here are solutions:

---

## ✅ Solution 1: Use MongoDB Atlas (Cloud - Easiest & Recommended)

### Step 1: Create Free MongoDB Atlas Account
1. Go to https://www.mongodb.com/cloud/atlas/register
2. Sign up for free (no credit card required)
3. Create a new cluster (choose FREE tier)

### Step 2: Get Connection String
1. Click "Connect" on your cluster
2. Choose "Connect your application"
3. Copy the connection string (looks like):
   ```
   mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```

### Step 3: Create .env File
Create a `.env` file in the `server` directory:

```env
mongoURI=mongodb+srv://your-username:your-password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

**Replace:**
- `your-username` with your MongoDB username
- `your-password` with your MongoDB password
- `cluster0.xxxxx` with your actual cluster address

### Step 4: Configure Network Access
1. In MongoDB Atlas dashboard
2. Go to "Network Access"
3. Click "Add IP Address"
4. Click "Allow Access from Anywhere" (for development) or add your IP

---

## ✅ Solution 2: Install MongoDB Locally (Windows)

### Step 1: Download MongoDB
1. Go to https://www.mongodb.com/try/download/community
2. Download MongoDB Community Server for Windows
3. Run the installer

### Step 2: Install MongoDB
- Choose "Complete" installation
- Install as a Windows Service (recommended)
- Install MongoDB Compass (GUI tool - optional but helpful)

### Step 3: Start MongoDB Service
Open PowerShell as Administrator and run:
```powershell
net start MongoDB
```

Or check if it's running:
```powershell
Get-Service MongoDB
```

### Step 4: Create .env File
Create a `.env` file in the `server` directory:

```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

### Step 5: Verify MongoDB is Running
Open a new terminal and run:
```bash
mongosh
```
If it connects, MongoDB is running!

---

## ✅ Solution 3: Use MongoDB Docker (Alternative)

If you have Docker installed:

```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

Then use in `.env`:
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

---

## 📝 Quick Fix: Create .env File Now

Create a file named `.env` in the `server` directory with:

**For MongoDB Atlas (Cloud):**
```env
mongoURI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

**For Local MongoDB:**
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

---

## 🔍 Troubleshooting

### Check if MongoDB is Running (Local)
```powershell
Get-Service MongoDB
```

### Start MongoDB Service (Local)
```powershell
net start MongoDB
```

### Check MongoDB Port
```powershell
netstat -an | findstr 27017
```

### Test Connection
```bash
mongosh mongodb://localhost:27017
```

---

## ⚠️ Important Notes

1. **.env file location:** Must be in the `server` directory (same folder as `server.js`)
2. **Restart server:** After creating/updating `.env`, restart your Node.js server
3. **MongoDB Atlas:** Free tier is perfect for development (512MB storage)
4. **Security:** Never commit `.env` file to git (it's already in .gitignore)

---

## 🚀 After Setup

Once MongoDB is connected, restart your server:
```bash
cd server
npm start
```

You should see: `MongoDB connected` in the console!





