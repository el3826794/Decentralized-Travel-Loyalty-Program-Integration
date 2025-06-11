;; Travel Provider Verification Contract
;; This contract validates travel service providers

(define-data-var admin principal tx-sender)

;; Map to store verified travel providers
(define-map verified-providers principal bool)

;; Error codes
(define-constant ERR-NOT-AUTHORIZED u100)
(define-constant ERR-ALREADY-VERIFIED u101)
(define-constant ERR-NOT-VERIFIED u102)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin)))

;; Verify a travel provider
(define-public (verify-provider (provider principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? verified-providers provider)) (err ERR-ALREADY-VERIFIED))
    (ok (map-set verified-providers provider true))))

;; Revoke verification from a provider
(define-public (revoke-verification (provider principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-some (map-get? verified-providers provider)) (err ERR-NOT-VERIFIED))
    (ok (map-set verified-providers provider false))))

;; Check if a provider is verified
(define-read-only (is-verified (provider principal))
  (default-to false (map-get? verified-providers provider)))

;; Transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (ok (var-set admin new-admin))))
