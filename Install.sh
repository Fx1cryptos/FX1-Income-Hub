#!/bin/bash

# FX1 Income Hub – Dependency Install Script
# Node.js + Next.js + React + Tailwind CSS setup

echo "🚀 Starting FX1 Income Hub setup..."

# Step 0: Check Node.js version
NODE_VERSION=$(node -v)
echo "Using Node.js version $NODE_VERSION (Node 18+ recommended)"

# Step 1: Initialize Node project
if [ ! -f package.json ]; then
  echo "Initializing Node.js project..."
  npm init -y
fi

# Step 2: Install frontend dependencies
echo "Installing Next.js + React..."
npm install react react-dom next

# Step 3: Install Tailwind CSS and PostCSS
echo "Installing Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Step 4: Install optional utilities
echo "Installing Axios, React Icons, Zustand..."
npm install axios react-icons zustand

# Step 5: Install ESLint and Prettier for dev
echo "Installing ESLint and Prettier..."
npm install -D eslint prettier eslint-config-prettier eslint-plugin-react

# Step 6: Create minimal Tailwind setup
echo "Setting up Tailwind CSS content paths..."
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./pages/**/*.{js,ts,jsx,tsx}", "./components/**/*.{js,ts,jsx,tsx}"],
  theme: { extend: {} },
  plugins: [],
}
EOL

# Step 7: Create basic pages folder if missing
mkdir -p pages components public

# Step 8: Done
echo "✅ Dependencies installed successfully!"
echo "Run 'npm run dev' to start the development server."
