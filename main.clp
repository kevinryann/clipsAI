(defrule start
=>
    (printout t"mean concave points : ")
    (assert(mean_concave_points(read))))

; RIGHT CHILD
(defrule worst_perimeter
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
=>
    (printout t"worst perimeter : ")
    (assert(worst_perimeter(read))))

(defrule zero_worst_perimeter
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (> ?worstPerimeter 114.45))
=>
    (printout t"Probabillity = 0"))

(defrule worst_texture
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
=>
    (printout t"worst texture : ")
    (assert(worst_texture(read))))

(defrule worst_concave_points
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (<= ?worstTexture 25.65))
=>
    (printout t"worst_concave_points : ")
    (assert(worst_concave_points(read))))

(defrule zero_worst_concave_points
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (<= ?worstTexture 25.65))
    (worst_concave_points ?worstConcavePoints)
    (test (<= ?worstConcavePoints 0.17))
=>
    (printout t"Probabillity : 1"))

(defrule one_worst_concave_points
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (<= ?worstTexture 25.65))
    (worst_concave_points ?worstConcavePoints)
    (test (> ?worstConcavePoints 0.17))
=>
    (printout t"Probability : 0"))

(defrule perimeter_error
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
=> 
    (printout t"perimeter error : ")
    (assert(perimeter_error(read))))

(defrule zero_perimeter_error
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
    (perimeter_error ?perimeterError)
    (test (> ?perimeterError 1.56))
=>
    (printout t"Probability : 0"))

(defrule mean_radius
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
    (perimeter_error ?perimeterError)
    (test (<= ?perimeterError 1.56))
=>
    (printout t"mean radius :")
    (assert(mean_radius(read))))

(defrule zero_mean_radius
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
    (perimeter_error ?perimeterError)
    (test (<= ?perimeterError 1.56))
    (mean_radius ?meanRadius)
    (test (<= ?meanRadius 13.34))
=>
    (printout t"Probability : 0"))

(defrule one_mean_radius
    (mean_concave_points ?meanConcavePoints)
    (test (> ?meanConcavePoints 0.05))
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
    (perimeter_error ?perimeterError)
    (test (<= ?perimeterError 1.56))
    (mean_radius ?meanRadius)
    (test (> ?meanRadius 13.34))
=>
    (printout t"Probability : 1"))




; (defrule left_worst_texture
;     (radius_error ?value)
;     (test(<= ?value3 0.63))
; =>
;     (printout t"worst texture : ")
;     (assert(left_worst_texture(read))))

; (defrule worst_area
;     (left_worst_texture ?value)
;     (test(> ?value 30.15))
; =>
;     (printout t"worst texture : ")
;     (assert(worst_texture(read))))

; (defrule mean
;     (left_worst_texture ?value)
;     (test(> ?value 30.15))
; =>
;     (printout t"worst texture : ")
;     (assert(worst_texture(read))))





; (defrule worst_texture
;     ?worst_perimeter <= 114.45
; =>
;     (assert(worst_texture(read))))

; (defrule worst_concave_points
;     ?worst_texture <= 25.65
; =>
;     (assert(worst_concave_points(read))))

; (defrule perimeter_error
;     ?worst_texture >25.65
; =>
;     (assert(perimeter_error(read))))

; (defrule mean_radius
;     ?perimeter_error <= 1.56
; =>
;     (assert(mean_radius(read))))

; LEFT CHILD
; (defrule worst_radius
;    (mean_concave_points ?mean_concave_points)
;     (test (<= ?mean_concave_points 0.05))
; =>
;     (printout t"worst radius : ")
;     (assert(worst_radius(read))))
; )



