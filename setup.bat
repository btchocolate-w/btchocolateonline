@echo off
REM BT Chocolate - Quick Setup Script for Windows

echo.
echo 🍫 BT Chocolate - Setup Wizard
echo ==============================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js v14 or higher.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ Node.js %NODE_VERSION% found
echo.

REM Backend Setup
echo 📦 Setting up Backend...
cd server
echo Installing server dependencies...
call npm install
echo ✅ Backend dependencies installed
echo.

REM Create .env for backend if it doesn't exist
if not exist .env (
    echo Creating .env file for backend...
    (
        echo NODE_ENV=development
        echo PORT=5000
        echo REACT_APP_API_URL=http://localhost:5000
        echo.
        echo FIREBASE_PROJECT_ID=btchocolateonline-w
        echo FIREBASE_API_KEY=AIzaSyBtECn9P5sQlZgqTDsQ8YgYCw9KucgqkF4
        echo FIREBASE_AUTH_DOMAIN=btchocolateonline-w.firebaseapp.com
        echo FIREBASE_STORAGE_BUCKET=btchocolateonline-w.firebasestorage.app
        echo FIREBASE_MESSAGING_SENDER_ID=681766069180
        echo FIREBASE_APP_ID=1:681766069180:web:db666cb8cb99dfb27841b9
        echo.
        echo JWT_SECRET=btchocolate_jwt_secret_2026_key_do_not_share
        echo.
        echo WHATSAPP_PHONE_NUMBER=36923388
    ) > .env
    echo ✅ Backend .env created
) else (
    echo ✅ Backend .env already exists
)

cd ..

REM Frontend Setup
echo 📦 Setting up Frontend...
cd client
echo Installing client dependencies...
call npm install
echo ✅ Frontend dependencies installed
echo.

REM Create .env for frontend if it doesn't exist
if not exist .env (
    echo Creating .env file for frontend...
    (
        echo REACT_APP_API_URL=http://localhost:5000/api
        echo REACT_APP_FIREBASE_API_KEY=AIzaSyBtECn9P5sQlZgqTDsQ8YgYCw9KucgqkF4
        echo REACT_APP_FIREBASE_AUTH_DOMAIN=btchocolateonline-w.firebaseapp.com
        echo REACT_APP_FIREBASE_PROJECT_ID=btchocolateonline-w
        echo REACT_APP_FIREBASE_STORAGE_BUCKET=btchocolateonline-w.firebasestorage.app
        echo REACT_APP_FIREBASE_MESSAGING_SENDER_ID=681766069180
        echo REACT_APP_FIREBASE_APP_ID=1:681766069180:web:db666cb8cb99dfb27841b9
    ) > .env
    echo ✅ Frontend .env created
) else (
    echo ✅ Frontend .env already exists
)

cd ..

echo.
echo ✅ Setup Complete!
echo.
echo 📝 Next Steps:
echo 1. Start Backend:  cd server ^&^& npm run dev
echo 2. Start Frontend: cd client ^&^& npm start
echo 3. Open browser:   http://localhost:3000
echo.
echo 🔑 Demo Credentials:
echo    Master Admin: JITHESH / Amaya#3452
echo    Admin: BTMANAGER / BT39115252
echo.
pause
