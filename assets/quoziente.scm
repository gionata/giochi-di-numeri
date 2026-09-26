; (quoziente n m) produce il quoziente della divisione intera di n per m
; es.: (quoziente 12 4) -> 3
(define quoziente
  (lambda (n m)
    (cond
      [(minore? n m) 0]
      [else (s (quoziente (sottrazione n m) m))])))
; 
; Esempio di valutazione:
;    (quoziente 12 4)
; -> (s (quoziente 8 4))
; -> (s (s (quoziente 4 4)))
; -> (s (s (s (quoziente 0 4))))
; -> (s (s (s 0)))
; -> (s (s 1))
; -> (s 2)
; -> 3
