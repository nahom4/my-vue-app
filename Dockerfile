

# Use the resolved Node.js version
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Copy all source files
COPY . .

# Install dependencies
RUN npm install


# Build the project
RUN npm run build


# Install serve globally
RUN npm install -g serve

# Expose the application port
EXPOSE 4200

# Serve the specified directory using the renamed variable
CMD ["sh", "-c", "serve -s ${OUTPUT_DIR:-dist} -l 4200"]