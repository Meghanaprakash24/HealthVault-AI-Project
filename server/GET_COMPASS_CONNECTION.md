# How to Get Connection String from MongoDB Compass

## Step-by-Step Guide

### Step 1: Open MongoDB Compass

1. Launch MongoDB Compass application
2. You should see the connection screen

### Step 2: Find Your Connection String

**Option A: If you're already connected:**
1. Look at the top of Compass window
2. You'll see your connection string displayed
3. It might look like:
   - `mongodb://localhost:27017` (local)
   - `mongodb+srv://username@cluster0.xxxxx.mongodb.net/` (Atlas)

**Option B: If you need to connect:**
1. In Compass, you'll see a connection string input field
2. It might be pre-filled or you might have saved connections
3. Click on your saved connection or enter a new one

### Step 3: Copy the Connection String

Copy the entire connection string from Compass.

**Examples:**

**Local MongoDB:**
```
mongodb://localhost:27017
```
or
```
mongodb://127.0.0.1:27017
```

**MongoDB Atlas:**
```
mongodb+srv://myuser:mypassword@cluster0.abc123.mongodb.net/
```

### Step 4: Format for Your .env File

**For Local MongoDB:**
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

**For MongoDB Atlas:**
```env
mongoURI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

**Important Notes:**
- Add `/healthcare` at the end (before `?` if using Atlas) - this is your database name
- For Atlas, add `?retryWrites=true&w=majority` at the end
- Make sure your password doesn't have special characters, or encode them:
  - `@` → `%40`
  - `#` → `%23`
  - `%` → `%25`

### Step 5: Update Your .env File

1. Open `.env` file in the `server` directory
2. Replace the `mongoURI` line with your connection string from Compass
3. Make sure to add `/healthcare` (database name) before any `?`

### Step 6: Test Connection

Restart your server:
```bash
npm start
```

You should see: `MongoDB connected` ✅

---

## 🔍 Can't Find Connection String?

### Check Compass Connection History:
1. In Compass, look for "Saved Connections" or "Recent Connections"
2. Click on your connection to see the full string

### Check MongoDB Atlas Dashboard:
1. Go to https://cloud.mongodb.com/
2. Login
3. Click "Connect" on your cluster
4. Choose "Connect your application"
5. Copy the connection string
6. Replace `<password>` with your actual password

---

## ⚠️ Common Issues

### Issue: Connection string has `<password>` placeholder
- Replace `<password>` with your actual MongoDB password
- Example: `mongodb+srv://user:MyPass123@cluster0.xxxxx.mongodb.net/`

### Issue: Password has special characters
- URL encode special characters:
  - `@` → `%40`
  - `#` → `%23`
  - `%` → `%25`
  - `&` → `%26`

### Issue: Connection works in Compass but not in code
- Make sure you added `/healthcare` (database name) to the connection string
- Check network access in Atlas (if using Atlas)
- Verify the connection string format matches exactly

---

## 📝 Quick Checklist

- [ ] Opened MongoDB Compass
- [ ] Found/copied connection string
- [ ] Added `/healthcare` to connection string
- [ ] Updated `.env` file
- [ ] Restarted server
- [ ] Checked console for "MongoDB connected"




