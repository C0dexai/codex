@echo off
echo 🚀 Starting CodexLab setup...

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm.
    pause
    exit /b 1
)

echo ✅ Node.js and npm are installed

REM Install root dependencies
echo 📦 Installing root dependencies...
npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install root dependencies
    pause
    exit /b 1
)

REM Install frontend dependencies
echo 📦 Installing frontend dependencies...
cd frontend
npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install frontend dependencies
    cd ..
    pause
    exit /b 1
)
cd ..

REM Install backend dependencies
echo 📦 Installing backend dependencies...
cd backend
npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install backend dependencies
    cd ..
    pause
    exit /b 1
)
cd ..

REM Copy environment file if it doesn't exist
if not exist "backend\.env" (
    echo 📝 Creating environment file...
    copy "backend\.env.example" "backend\.env"
    echo ⚠️  Please update backend\.env with your actual API keys
)

echo.
echo ✅ Setup complete!
echo.
echo 🚀 To start the development server, run:
echo    npm run dev
echo.
echo 🔧 To start the backend server, run:
echo    npm run dev:backend
echo.
echo 📝 Don't forget to update backend\.env with your actual API keys
echo.
pause