const sum = require('../sum');
const diff = require('../diff');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});

test('diff 2 - 1 to equal 1', () => {
  expect(diff(2, 1)).toBe(1);
});
