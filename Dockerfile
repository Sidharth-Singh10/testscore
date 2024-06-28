# Define the Node.js version as a build argument
ARG NODE_VERSION=22.2.0

# Use the official Node.js image as the base image
FROM node:${NODE_VERSION}-alpine as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY backend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY backend .

# Build the TypeScript application
RUN npx tsc -b

# Create a new stage for the final production image
FROM node:${NODE_VERSION}-alpine

# Set the environment to production
ENV NODE_ENV=production

# Set the working directory
WORKDIR /app

# Copy the built application from the previous stage
COPY --from=build /app /app

# Expose the application port
EXPOSE 4000

# Command to run the application
CMD ["node", "dist/index.js"]
