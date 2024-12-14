/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./src/**/*.{js,jsx,ts,tsx}",
      "./public/index.html"
    ],
    theme: {
      extend: {
        colors: {
          primary: '#4f46e5', // Example custom color
          secondary: '#9333ea'
        }
      }
    },
    plugins: []
  };
  