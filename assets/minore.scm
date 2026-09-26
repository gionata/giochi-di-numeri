; (minore? n m) produce #t se n è minore di m, #f altrimenti
; es.: (minore? 2 5) -> #t
;      (minore? 5 2) -> #f
(define minore?
  (lambda (n m)
    (cond
      [(zero? m) #f]
      [(zero? n) #t]
      [else (minore? (p n) (p m))])))
;
; Esempio di valutazione:
;    (minore? 2 5)
; -> (minore? 1 4)
; -> (minore? 0 3)
; -> #t
