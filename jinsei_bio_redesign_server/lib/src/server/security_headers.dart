import 'dart:io';

/// Helper method to inject OWASP Backend Security Headers
void applyProductionSecurityHeaders(HttpResponse response,
    {bool isProduction = false}) {
  response.headers.contentType = ContentType.json;
  response.headers.set('Access-Control-Allow-Origin', '*');
  response.headers.set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  response.headers.set('Access-Control-Allow-Headers',
      'Content-Type, Authorization, X-Serverpod-Method');
  response.headers.set('X-Content-Type-Options', 'nosniff');
  response.headers.set('X-Frame-Options', 'DENY');
  response.headers.set('X-XSS-Protection', '1; mode=block');
  if (isProduction) {
    response.headers.set(
        'Strict-Transport-Security', 'max-age=31536000; includeSubDomains');
  }
}
