priority 2
when RULE_INIT {
  set static::ACME_http-01_validator_class {ACME_http-01}
  set static::ACME_http-01_error_response {<html><body><h1>503 - Error</h1><p>Content not found.</p></body></html>}
}
when HTTP_REQUEST {
  if { [string tolower [HTTP::uri]] starts_with {/.well-known/acme-challenge/}
    and [class match [HTTP::uri] ends_with ${static::ACME_http-01_validator_class}] != {} } {
    set response_content [class lookup [substr [HTTP::uri] 28] ${static::ACME_http-01_validator_class}]
    if { ${response_content} != {} } {
      HTTP::respond 200 -version auto content ${response_content} noserver Content-Type {text/plain} Content-Length [string length ${response_content}] Cache-Control no-store
    } else {
      HTTP::respond 503 -version auto content ${static::ACME_http-01_error_response} noserver Content-Type {text/html} Content-Length [string length ${static::ACME_http-01_error_response}] Cache-Control no-store
    }
    unset response_content
    event disable all
    return
  }
}
