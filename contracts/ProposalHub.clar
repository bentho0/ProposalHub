;; ProposalHub: A decentralized platform for community proposal voting
;; Core Data Structures
(define-map supporters principal uint)    ;; Tracks users and their supported proposals
(define-map proposals uint uint)          ;; Tracks proposals and their support counts
(define-data-var proposal-counter uint u0) ;; Keeps count of total registered proposals

;; Public function to submit a new community proposal
(define-public (submit-proposal)
  (let ((proposal-id (+ (var-get proposal-counter) u1)))
    (map-set proposals proposal-id u0)      ;; Initialize support for the new proposal to 0
    (var-set proposal-counter proposal-id)  ;; Increment proposal-counter
    (ok proposal-id)
  )
)

;; Public function to support a proposal
(define-public (support-proposal (proposal-id uint))
  (let ((voter tx-sender))
    (if (is-some (map-get? supporters voter))
        (err u1000)  ;; Error: User has already supported a proposal
        (if (is-none (map-get? proposals proposal-id))
            (err u1001)  ;; Error: Proposal does not exist
            (begin
              ;; Register the user's support
              (map-set supporters voter proposal-id)
              ;; Increment the proposal's support count
              (map-set proposals proposal-id (+ (default-to u0 (map-get? proposals proposal-id)) u1))
              (ok proposal-id)
            )
        )
    )
  )
)

;; Read-only function to get total support for a proposal
(define-read-only (get-support-count (proposal-id uint))
  (default-to u0 (map-get? proposals proposal-id))
)

;; Read-only function to check if a user has supported any proposal
(define-read-only (has-supported (voter principal))
  (is-some (map-get? supporters voter))
)

;; Read-only function to get the total number of proposals
(define-read-only (get-proposal-count)
  (var-get proposal-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-max (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)