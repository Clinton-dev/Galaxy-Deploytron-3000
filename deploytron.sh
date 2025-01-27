#!/bin/bash

# Define color codes for flashy output
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Fancy banner with the script's name
echo -e "${CYAN}======================================="
echo -e "🚀✨ Welcome to the ${GREEN}Galaxy Deploytron 3000 ✨🚀"
echo -e "    For React Deployments Only! ⚛️"
echo -e "${CYAN}=======================================${RESET}"

# Pull latest changes
echo -e "${BLUE}📡 Pulling latest changes from Git...${RESET}"
git pull origin main
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✔ Successfully pulled latest changes!${RESET}"
else
  echo -e "${RED}✖ Failed to pull changes. Exiting.${RESET}"
  exit 1
fi

# Install dependencies
echo -e "${YELLOW}📦 Installing dependencies (React)...${RESET}"
npm install
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✔ Dependencies installed successfully!${RESET}"
else
  echo -e "${RED}✖ Failed to install dependencies. Exiting.${RESET}"
  exit 1
fi

# Build the React app
echo -e "${CYAN}⚛️ Building the React app...${RESET}"
npm run build
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✔ Build completed successfully!${RESET}"
else
  echo -e "${RED}✖ Build failed. Exiting.${RESET}"
  exit 1
fi

# Restart Nginx
echo -e "${BLUE}🔄 Restarting Nginx to serve the React app...${RESET}"
sudo systemctl restart nginx
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✔ Nginx restarted successfully!${RESET}"
else
  echo -e "${RED}✖ Failed to restart Nginx. Exiting.${RESET}"
  exit 1
fi

# Success message with flair
echo -e "${GREEN}==========================================="
echo -e "🎉✨ React Deployment Complete! ${BLUE}Galaxy Deploytron 3000 ✨${GREEN} says: You're awesome! 🎉"
echo -e "${GREEN}===========================================${RESET}"
