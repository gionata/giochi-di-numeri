; (sottrazione n m) produce la differenza tra n e m
; es.: (sottrazione 5 2) -> 3
(define sottrazione
  (lambda (n m)
    (cond
      [(zero? m) n]
      [else (sottrazione (p n) (p m))])))
;
; Esempio di valutazione:
;    (sottrazione 5 2)
; -> (sottrazione 4 1)
; -> (sottrazione 3 0)
; -> 3
