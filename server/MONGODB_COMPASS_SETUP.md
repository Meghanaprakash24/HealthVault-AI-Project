# MongoDB Compass Setup Guide

## Using MongoDB Compass with This Project

MongoDB Compass is a GUI tool - your code doesn't need changes! You just need to ensure:
1. MongoDB server is running (local or Atlas)
2. Connection string matches what you use in Compass

---

## Step 1: Check Your MongoDB Compass Connection

In MongoDB Compass, check what connection string you're using:

### If connecting to Local MongoDB:
- Connection String: `mongodb://localhost:27017`
- Or: `mongodb://127.0.0.1:27017`

### If connecting to MongoDB Atlas:
- Connection String: `mongodb+srv://username:password@cluster.xxxxx.mongodb.net`

---

## Step 2: Create .env File

Create a `.env` file in the `server` directory with the same connection string you use in Compass:

### For Local MongoDB (Default):
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

### For MongoDB Atlas:
```env
mongoURI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

**Important:** 
- Use the same connection string format as Compass
- Add `/healthcare` at the end (database name)
- Replace `username` and `password` with your actual credentials if using Atlas

---

## Step 3: Start MongoDB Service (If Using Local)

If you're using local MongoDB, make sure it's running:

### Check if MongoDB is running:
```powershell
Get-Service MongoDB
```

### Start MongoDB Service:
```powershell
net start MongoDB
```

### Or start MongoDB manually:
```powershell
mongod --dbpath "C:\data\db"
```
(Replace with your actual data directory path)

---

## Step 4: Verify Connection

1. **In MongoDB Compass:** Make sure you can connect and see databases
2. **In your code:** Restart your server:
   ```bash
   cd server
   npm start
   ```
3. You should see: `MongoDB connected` ✅

---

## Troubleshooting

### MongoDB Service Not Found?
- MongoDB might not be installed as a service
- Start it manually: `mongod --dbpath "C:\data\db"`

### Connection Refused?
- Check if MongoDB is running on port 27017
- Verify the connection string matches Compass
- Check firewall settings

### Port Already in Use?
- Another MongoDB instance might be running
- Check: `netstat -an | findstr "27017"`

---

## Quick Setup Checklist

- [ ] MongoDB Compass can connect successfully
- [ ] Note the connection string from Compass
- [ ] Create `.env` file in `server` directory
- [ ] Add `mongoURI` with connection string + `/healthcare`
- [ ] Add `PORT=5000`
- [ ] Start MongoDB service (if local)
- [ ] Restart Node.js server
- [ ] Check console for "MongoDB connected"

---

## Example .env File

**For Local MongoDB:**
```env
mongoURI=mongodb://localhost:27017/healthcare
PORT=5000
```

**For MongoDB Atlas:**
```env
mongoURI=mongodb+srv://myuser:mypassword@cluster0.abc123.mongodb.net/healthcare?retryWrites=true&w=majority
PORT=5000
```

The code in `server.js` will automatically use the connection string from `.env` file!

