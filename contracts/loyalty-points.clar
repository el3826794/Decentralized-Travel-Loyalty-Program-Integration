;; Loyalty Points Contract
;; Manages travel loyalty points

(define-fungible-token loyalty-points)

;; Map to store authorized contracts that can mint/burn points
(define-map authorized-contracts principal bool)

;; Data variable for admin
(define-data-var admin principal tx-sender)

;; Error codes
(define-constant ERR-NOT-AUTHORIZED u100)
(define-constant ERR-INSUFFICIENT-BALANCE u101)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin)))

;; Check if contract is authorized
(define-private (is-authorized-contract (contract principal))
  (default-to false (map-get? authorized-contracts contract)))

;; Authorize a contract to mint/burn points
(define-public (authorize-contract (contract principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (ok (map-set authorized-contracts contract true))))

;; Revoke authorization from a contract
(define-public (revoke-contract-authorization (contract principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (ok (map-set authorized-contracts contract false))))

;; Mint loyalty points to a user
(define-public (mint (recipient principal) (amount uint))
  (begin
    (asserts! (or (is-admin) (is-authorized-contract tx-sender)) (err ERR-NOT-AUTHORIZED))
    (ft-mint? loyalty-points amount recipient)))

;; Burn loyalty points from a user
(define-public (burn (owner principal) (amount uint))
  (begin
    (asserts! (or (is-admin) (is-authorized-contract tx-sender)) (err ERR-NOT-AUTHORIZED))
    (ft-burn? loyalty-points amount owner)))

;; Transfer loyalty points between users
(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (asserts! (or (is-eq tx-sender sender) (is-authorized-contract tx-sender)) (err ERR-NOT-AUTHORIZED))
    (ft-transfer? loyalty-points amount sender recipient)))

;; Get balance of a user
(define-read-only (get-balance (user principal))
  (ft-get-balance loyalty-points user))

;; Transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (ok (var-set admin new-admin))))
