; (addizione n m) produce la somma di n e m
; es.: (addizione 3 0) -> 3
;      (addizione 3 2) -> 5
(define addizione
  (lambda (n m)
    (cond
      [(zero? m) n]
      [else (s (addizione n (p m)))])))
;
; Esempio di valutazione:
;    (addizione 3 2)
; -> (s (addizione 3 (p 2)))
; -> (s (addizione 3 1))
; -> (s (s (addizione 3 (p 1))))
; -> (s (s (addizione 3 0)))
; -> (s (s 3))
; -> (s 4)
; -> 5
