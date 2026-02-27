#!/bin/bash
# BT Chocolate - Quick Setup Script for Linux/Mac

echo "🍫 BT Chocolate - Setup Wizard"
echo "=============================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v14 or higher."
    exit 1
fi

echo "✅ Node.js $(node --version) found"
echo ""

# Backend Setup
echo "📦 Setting up Backend..."
cd server
echo "Installing server dependencies..."
npm install
echo "✅ Backend dependencies installed"
echo ""

# Create .env for backend if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file for backend..."
    cat > .env << EOF
NODE_ENV=development
PORT=5000
REACT_APP_API_URL=http://localhost:5000




WHATSAPP_PHONE_NUMBER=36923388
EOF
    echo "✅ Backend .env created"
else
    echo "✅ Backend .env already exists"
fi

cd ..

# Frontend Setup
echo "📦 Setting up Frontend..."
cd client
echo "Installing client dependencies..."
npm install
echo "✅ Frontend dependencies installed"
echo ""

# Create .env for frontend if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file for frontend..."
    cat > .env << EOF

EOF
    echo "✅ Frontend .env created"
else
    echo "✅ Frontend .env already exists"
fi

cd ..

echo ""
echo "✅ Setup Complete!"
echo ""
echo "📝 Next Steps:"
echo "1. Start Backend:  cd server && npm run dev"
echo "2. Start Frontend: cd client && npm start"
echo "3. Open browser:   http://localhost:3000"
echo ""
echo "🔑 Demo Credentials:"
echo "   Master Admin: JITHESH / Amaya#3452"
echo "   Admin: BTMANAGER / BT39115252"
