#syntax=docker/dockerfile:1.4
FROM node:18-alpine

WORKDIR /app

# Install dependencies based on the preferred package manager
COPY --link package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
RUN yarn install

COPY --link src ./src
COPY --link public ./public
COPY --link scripts ./scripts
COPY --link next.config.js .
COPY --link tsconfig.json .
COPY --link tsconfig.node.json .
COPY --link tailwind.config.js .
COPY --link postcss.config.js .

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
# ENV NEXT_TELEMETRY_DISABLED 1

# Note: Don't expose ports here, Compose will handle that for us

# Start Next.js in development mode based on the preferred package manager
CMD yarn dev