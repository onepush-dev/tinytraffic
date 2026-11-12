# tinytraffic — simple, privacy-friendly web analytics (one binary, one DuckDB file, no cookies). Deploy on Railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

[tinytraffic](https://github.com/egoist/tinytraffic) (AGPL-3.0, by egoist) is a tiny self-hosted analytics server: a ~1 KB tracker,
pageviews, outbound clicks, custom events (Plausible-compatible event format), public dashboards and an API.

This repo wraps the official image `ghcr.io/egoist/tinytraffic:0.3.2` unmodified as `ghcr.io/onepush-dev/tinytraffic:0.3.2`.
Only Railway-specific defaults change: runs as root (Railway volumes are root-owned), `TT_TRUST_PROXY=true` (real visitor IPs
behind the Railway edge), `TT_MEMORY_LIMIT=512MB`.

## What the template sets up
- One service `tinytraffic` listening on 8080 with a public domain
- A volume at `/data` (`tinytraffic.duckdb`)
- `TT_PASSWORD`: a generated dashboard password (read it from the service Variables tab), so nobody else can claim the setup screen

## Use it
1. Open the Railway domain and sign in with `TT_PASSWORD`.
2. Add a site and paste its snippet into your site's `<head>`:
   `<script defer data-domain="example.com" src="https://<your-domain>/js/script.js"></script>`

## Notes
- Keep one replica: DuckDB is a single-file database (ClickHouse via `TT_CLICKHOUSE_URL` is optional upstream).
- `TT_PASSWORD` only sets the password on first start; change it later in the dashboard.
