# Artha360

M1 is an offline-first personal financial intelligence PWA. Open it from a local web server (for example, GitHub Pages or any static host) and it stores structured data in IndexedDB on the device.

## Included in M1

- Local-first IndexedDB stores for accounts, balance-sheet items, transactions, financial events, and a cloud-sync outbox.
- Onboarding forms for bank accounts, credit cards, cash, assets, liabilities and a universal transaction ledger.
- Net-worth, debt-to-assets, current-month spending, data-health, duplicate detection, and reconciliation-staleness calculations.
- SMS Backup & Restore XML parsing that stages likely financial messages locally for individual review.
- Bank-statement CSV import with common-header detection, local staging, duplicate checking, transaction categorisation, and individual account assignment.
- Monthly cash-flow and leading-expense-category insight drawn from the universal ledger.
- Financial Planning Intelligence: category budgets, savings goals, emergency-fund coverage, a 30-day cash-flow forecast, recurring-payment detection, and category review for uncategorised expense records.
- A service worker and manifest for installable offline use. The `CloudSyncAdapter` is a deliberately transport-neutral queue boundary for a future authenticated encrypted sync service; it does not upload financial data.

## Run

Serve this directory over HTTP(S); service workers are not available from `file://` pages. No build step or server is required.
The Personal Financial Operating System that knows your financial life better than you do—while keeping your data under your control.
