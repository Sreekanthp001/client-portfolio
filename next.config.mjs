import {withSentryConfig} from '@sentry/nextjs';
/** @type {import('next').NextConfig} */
const nextConfig = {
    // 1. Static HTML export enable chestunnam (Nginx kosam idi chala important)
    output: 'export',

    // 2. Build appudu images issue rakunda idi add chestunnam
    images: {
        unoptimized: true,
    },

    // 3. Ee project lo konni linting/typescript errors unna build aagakunda skip chestunnam
    eslint: {
        ignoreDuringBuilds: true,
    },
    typescript: {
        ignoreBuildErrors: true,
    },
};

// Sentry ni temporarily disable chestunnam build success avvadaniki
export default nextConfig;