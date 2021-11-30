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

(defrule worst_texture
    (worst_perimeter ?worstPerimeter)
    (test (<= ?worstPerimeter 114.45))
=>
    (printout t"worst texture : ")
    (assert(worst_texture(read))))

(defrule worst_concave_points
    (worst_texture ?worstTexture)
    (test (<= ?worstTexture 25.65))
=>
    (printout t"worst_concave_points : ")
    (assert(worst_concave_points(read))))

(defrule perimeter_error
    (worst_texture ?worstTexture)
    (test (> ?worstTexture 25.65))
=> 
    (printout t"perimeter error : ")
    (assert(perimeter_error(read))))

(defrule mean_radius
    (perimeter_error ?perimeterError)
    (test (<= ?perimeterError 1.56))
=>
    (printout t"mean radius :")
    (assert(mean_radius(read))))



; LEFT CHILD
(defrule worst_radius
    (mean_concave_points ?value)
    (test(<= ?value 0.05))
=>
    (printout t"worst radius : ")
    (assert(worst_radius(read))))

(defrule mean_texture
    (worst_radius ?value)
    (test(> ?value 16.83))
=>
    (printout t"mean texture : ")
    (assert(mean_texture(read))))

(defrule concave_points_error
    (mean_texture ?value)
    (test(> ?value 16.19))
=>
    (printout t"concave points error : ")
    (assert(concave_points_error(read))))

(defrule radius_error
    (worst_radius ?value)
    (test(<= ?value 16.83))
=>
    (printout t"radius error : ")
    (assert(radius_error(read))))

(defrule mean_smoothness
    (radius_error ?value)
    (test(> ?value 0.63))
=>
    (printout t"mean smoothness : ")
    (assert(mean_smoothness(read))))

(defrule left_worst_texture
    (radius_error ?value)
    (test(<= ?value 0.63))
=>
    (printout t"worst texture : ")
    (assert(left_worst_texture(read))))

(defrule worst_area
    (left_worst_texture ?value)
    (test(> ?value 30.15))
=>
    (printout t"worst area : ")
    (assert(worst_area(read))))

(defrule left_mean_radius
    (worst_area ?value)
    (test(> ?value 641.60))
=>
    (printout t"mean radius : ")
    (assert(left_mean_radius(read))))

(defrule left_mean_texture
    (left_mean_radius ?value)
    (test(<= ?value 13.45))
=>
    (printout t"mean texture : ")
    (assert(left_mean_texture(read))))

(defrule one_result
    (or 
        ((left_worst_texture ?value1) (test (<= ?value1 30.15)))
        ((worst_area ?value2) (test (<= ?value2 641.60)))
        ((left_mean_texture ?value3) (test (> ?value3 28.79)))
        ((left_mean_radius ?value4) (test (> ?value4 13.45)))
        ((mean_texture ?value5) (test (<= ?value5 16.19)))
        ((concave_points_error ?value6) (test (> ?value6 0.01)))
        ((mean_smoothness ?value7) (test (<= ?value7 0.09)))
        ((worst_concave_points ?worstConcavePoints)(test (<= ?worstConcavePoints 0.17)))
        ((mean_radius ?meanRadius)(test (> ?meanRadius 13.34)))
    )
=>
;    (printout t"Probability : 1")
    (printout t"Hasil Prediksi = Terprediksi terkena kanker payudara")
)

(defrule zero_result
    (or 
        ((left_mean_texture ?value1) (test (<= ?value1 28.79)))
        ((concave_points_error ?value2) (test (<= ?value2 0.01)))
        ((mean_smoothness ?value3) (test (> ?value3 0.09)))
        ((worst_perimeter ?worstPerimeter)(test (> ?worstPerimeter 114.45)))
        ((worst_concave_points ?worstConcavePoints)(test (> ?worstConcavePoints 0.17)))
        ((perimeter_error ?perimeterError)(test (> ?perimeterError 1.56)))
        ((mean_radius ?meanRadius)(test (<= ?meanRadius 13.34)))
    )
=>
;    (printout t"Probability : 0")
    (printout t"Hasil Prediksi = Terprediksi tidak terkena kanker payudara")
)




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

; LEFT 
; (defrule worst_radius
;    (mean_concave_points ?mean_concave_points)
;     (test (<= ?mean_concave_points 0.05))
; =>
;     (printout t"worst radius : ")
;     (assert(worst_radius(read))))
; )
