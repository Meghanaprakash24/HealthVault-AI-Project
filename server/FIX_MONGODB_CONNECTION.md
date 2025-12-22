# Fix MongoDB Connection Refused Error

## Problem Identified
MongoDB is not running locally. Since you're using MongoDB Compass, you're likely connecting to **MongoDB Atlas** (cloud).

---

## ✅ Solution: Use MongoDB Atlas Connection String

### Step 1: Get Your Atlas Connection String from Compass

1. Open MongoDB Compass
2. Look at the connection string you're using (at the top)
3. It should look like:
   ```
   mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/
   ```

### Step 2: Update Your .env File

Edit the `.env` file in the `server` directory:

**Current (Local - Not Working):**
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

**Change to (Atlas - Working):**
```env
mongoURI=mongodb+srv://your-username:your-password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

**Replace:**
- `your-username` → Your MongoDB Atlas username
- `your-password` → Your MongoDB Atlas password  
- `cluster0.xxxxx` → Your actual cluster address from Compass

### Step 3: Get Connection String from Atlas Dashboard

If you don't have the connection string:

1. Go to https://cloud.mongodb.com/
2. Login to your account
3. Click "Connect" on your cluster
4. Choose "Connect your application"
5. Copy the connection string
6. Replace `<password>` with your actual password
7. Add `/healthcare` before the `?` (database name)

**Example:**
```
mongodb+srv://myuser:mypassword123@cluster0.abc123.mongodb.net/healthcare?retryWrites=true&w=majority
```

### Step 4: Restart Your Server

```bash
cd server
npm start
```

You should now see: `MongoDB connected` ✅

---

## 🔍 Alternative: Install MongoDB Locally

If you prefer local MongoDB:

### Option A: Install MongoDB Community Server
1. Download: https://www.mongodb.com/try/download/community
2. Install MongoDB Community Server
3. During installation, choose "Install as a Windows Service"
4. Start the service:
   ```powershell
   net start MongoDB
   ```
5. Keep your `.env` as:
   ```env
   mongoURI=mongodb://localhost:27017/healthcare
   PORT=5000
   ```

### Option B: Use MongoDB Docker
```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

---

## ⚠️ Common Issues

### Issue 1: Password has special characters
If your password has special characters like `@`, `#`, `%`, encode them:
- `@` → `%40`
- `#` → `%23`
- `%` → `%25`

### Issue 2: Network Access not configured
In MongoDB Atlas:
1. Go to "Network Access"
2. Click "Add IP Address"
3. Click "Allow Access from Anywhere" (for development)
4. Or add your specific IP address

### Issue 3: Wrong database name
Make sure the database name in the connection string matches:
- Connection string: `...mongodb.net/healthcare?...`
- Database name: `healthcare`

---

## 🚀 Quick Test

After updating `.env`, test the connection:

```bash
cd server
node -e "require('dotenv').config(); const mongoose = require('mongoose'); mongoose.connect(process.env.mongoURI).then(() => console.log('Connected!')).catch(err => console.error('Error:', err));"
```

---

## 📝 Summary

**Most Likely Solution:**
1. Copy connection string from MongoDB Compass
2. Update `.env` file with Atlas connection string
3. Add `/healthcare` before `?` in the connection string
4. Restart server

Your `.env` file should look like:
```env
mongoURI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```





