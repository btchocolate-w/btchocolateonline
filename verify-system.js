#!/usr/bin/env node

/**
 * BT Chocolate System Verification Script
 * Tests all critical functionality
 */

const http = require('http');

console.log('\n🧪 BT Chocolate E-Commerce System - Verification Test\n');
console.log('=' .repeat(60));

// Test configuration
const tests = [
  {
    name: 'Backend Server Running',
    method: 'GET',
    host: 'localhost',
    port: 5000,
    path: '/api/products',
    timeout: 3000
  },
  {
    name: 'Frontend Server Running',
    method: 'GET',
    host: 'localhost',
    port: 3000,
    path: '/',
    timeout: 3000
  },
  {
    name: 'Database Initialize Endpoint',
    method: 'POST',
    host: 'localhost',
    port: 5000,
    path: '/api/init/initialize',
    timeout: 5000,
    skipInitialize: true // Don't actually call if DB might be seeded
  }
];

// Run tests
let passed = 0;
let failed = 0;

function runTest(test, callback) {
  const options = {
    hostname: test.host,
    port: test.port,
    path: test.path,
    method: test.method,
    timeout: test.timeout
  };

  const req = http.request(options, (res) => {
    const statusOk = res.statusCode >= 200 && res.statusCode < 400;
    const result = statusOk ? '✅ PASS' : `⚠️ STATUS ${res.statusCode}`;
    console.log(`${result} | ${test.name} (${test.host}:${test.port})`);
    
    if (statusOk) {
      passed++;
    } else {
      failed++;
    }
    
    res.on('data', () => {}); // Consume response
    res.on('end', callback);
  });

  req.on('error', (err) => {
    console.log(`❌ FAIL | ${test.name} - ${err.message}`);
    failed++;
    callback();
  });

  req.on('timeout', () => {
    console.log(`⏱️ TIMEOUT | ${test.name} - Connection timeout`);
    req.destroy();
    failed++;
    callback();
  });

  if (test.method === 'POST') {
    req.write('');
  }
  
  req.end();
}

// Run all tests sequentially
function runAllTests(index) {
  if (index >= tests.length) {
    // Print summary
    console.log('\n' + '='.repeat(60));
    console.log(`\n📊 Test Results: ${passed} passed, ${failed} failed\n`);
    
    if (failed === 0) {
      console.log('🎉 All systems operational! Ready to initialize database.\n');
      console.log('Next Steps:');
      console.log('1. Open http://localhost:3000 in your browser');
      console.log('2. Click "Initialize Database" button');
      console.log('3. Login as admin: JITHESH / Amaya#3452');
      console.log('4. Create products with image uploads');
      console.log('5. Test shopping flow\n');
    } else {
      console.log('⚠️ Some services are not responding. Please check:\n');
      console.log('Backend:');
      console.log('  cd D:\\btchocolate\\server');
      console.log('  node index.js\n');
      console.log('Frontend:');
      console.log('  cd D:\\btchocolate\\client');
      console.log('  npm start\n');
    }
    
    process.exit(failed > 0 ? 1 : 0);
  } else {
    runTest(tests[index], () => {
      runAllTests(index + 1);
    });
  }
}

console.log('Testing services...\n');
runAllTests(0);
