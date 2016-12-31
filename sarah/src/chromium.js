const fs     = require( 'fs' );
const path   = require( 'path' );
const webkit = require( './chromium.webkit.json' );
const prefPath = path.resolve( process.env['HOME'], '.config/chromium/Default/Preferences' );
const pref   = JSON.parse(
  fs.readFileSync( prefPath )
  .toString()
);

pref.webkit = webkit;

fs.writeFileSync( prefPath, JSON.stringify( pref, null, '' ) );
fs.writeFileSync( '/tmp/chromium.json', JSON.stringify( pref, null, '  ' ) );

