FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install from GitHub Packages (requires GITHUB_TOKEN at build time)
ARG GITHUB_TOKEN
RUN echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" > ~/.npmrc && \
    npm install --registry=https://npm.pkg.github.com && \
    rm ~/.npmrc

COPY . .

CMD ["node", "index.js"]
