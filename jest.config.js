module.exports = {
  testEnvironment: 'node',
  testMatch: ['**/*.test.js'],
  coverageReporters: [
    'clover',
    'json',
    'lcov',
    ['text', { skipFull: true }],
    'json-summary',
  ],
};
