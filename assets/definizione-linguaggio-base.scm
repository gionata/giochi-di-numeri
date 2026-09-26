; (s n) produce il numero che segue immediatamente n
; es.: (s 3) -> 4
(define s
  (lambda (n)
    (+ n 1)))

; (p n) produce il numero che precede immediatamente n
; es.: (p 3) -> 2
(define p
  (lambda (n)
    (- n 1)))

; (zero? n) produce #t se n è zero, #f altrimenti
; es.: (zero? 0) -> #t
;      (zero? 3) -> #f
; è già definito dal linguaggio Scheme
