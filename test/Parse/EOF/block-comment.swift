// RUN: %swift %s -verify

/* unterminated block comment expected-note{{comment started here}}
   expected-error{{unterminated '/*' comment}} {{60-60=*/}}
