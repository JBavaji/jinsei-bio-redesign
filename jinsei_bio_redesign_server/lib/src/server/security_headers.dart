import 'dart:io';

/// Helper method to inject OWASP Backend Security Headers
void applyProductionSecurityHeaders(HttpResponse response,
    {bool isProduction = false}) {
  response.headers.contentType = ContentType.json;
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
      'Content-Type, Authorization, X-Serverpod-Method');
  response.headers.add('X-Content-Type-Options', 'nosniff');
  response.headers.add('X-Frame-Options', 'DENY');
  response.headers.add('X-XSS-Protection', '1; mode=block');
  if (isProduction) {
    response.headers.add(
        'Strict-Transport-Security', 'max-age=31536000; includeSubDomains');
  }
}
