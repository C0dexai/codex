#!/bin/bash
echo "🚀 Starting CodexLab setup..."
cd frontend && npm install
cd ../backend && npm install
cd ..
chmod +x setup.sh
echo "✅ Setup complete."
