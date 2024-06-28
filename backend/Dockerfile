# Build stage
ARG NODE_VERSION=22.2.0

FROM node:${NODE_VERSION}-alpine AS base

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the TypeScript application
RUN npx tsc -b

# Production stage
FROM node:${NODE_VERSION}-alpine AS production

# Set the working directory
WORKDIR /app

# Copy the built application and node_modules from the build stage
COPY --from=base /app/dist ./dist
COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/package*.json ./

# Expose port 4000 to the outside world
EXPOSE 4000

# Set environment variable to indicate production environment
ENV NODE_ENV production

# Start the Express.js application
CMD ["node", "dist/index.js"]
