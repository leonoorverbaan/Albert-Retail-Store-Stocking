(define (domain albert_sim_final)

    (:requirements
        :typing
        :durative-actions
        :conditional-effects
        :disjunctive-preconditions
        :negative-preconditions
        :fluents
        )

    (:types
        waypoint
        robot
        bin
        object
        gripper
        shelf_snack
        shelf_drink
    )
    
    (:predicates
        (visited ?wp - waypoint)
        (robot-at ?v - robot ?wp - waypoint)
        (object-at ?obj - object ?wp - waypoint)
        (placed ?obj - object)
        (is_holding ?g - gripper ?obj - object)
        (free ?g - gripper)
        (expired ?obj - object)
        (not-expired ?obj - object)
        (empty ?obj - object)
        (heavy ?obj - object)
        (snack ?obj - object)
        (drink ?obj - object)
        (bin-at ?b - bin ?wp_bin - waypoint)
        (shelfdrink-at ?sd - shelf_drink ?wp_shelf_drink - waypoint)
        (shelfsnack-at ?ss - shelf_snack ?wp_shelf_snack - waypoint)
        (drinkspot ?wp - waypoint)
        (snackspot ?wp - waypoint)
        (binspot ?wp - waypoint)
    )
    
    (:functions
        (bin_room ?b - bin)
        (snack_room ?ss - shelf_snack)
        (drink_room ?sd - shelf_drink)
    )

    (:durative-action move
        :parameters (?v - robot ?from ?to - waypoint)
        :duration ( = ?duration 40)
        :condition (and
            (at start (robot-at ?v ?from))
        )
        :effect (and
            (at end (visited ?to))
            (at end (robot-at ?v ?to))
            (at start(not
                (robot-at ?v ?from)
            ))
        )
    )

    
    (:durative-action pick
        :parameters (?v - robot ?wp - waypoint ?obj - object ?g - gripper)
        :duration (= ?duration 50)
        :condition (and
            (over all (robot-at ?v ?wp))
            (at start (object-at ?obj ?wp))
            (at start (free ?g))


        )
        :effect (and 
        (at end (and
            (is_holding ?g ?obj)
            (not (free ?g))
            (not (object-at ?obj ?wp))
            )
        )

	;; ADD YOUR EFFECTS

        )
    )

    (:durative-action place_bin
        :parameters (?v - robot ?wp_bin - waypoint ?obj - object ?g - gripper ?b - bin) 
        :duration (= ?duration 50)
        :condition (and
           ; (over all (robot-at ?v ?wp))
           (over all (robot-at ?v ?wp_bin))
            (at start (is_holding ?g ?obj))
            (at start  (expired ?obj))
            ;(at start (or (expired ?obj) (empty ?obj)))
            (at start (>= (bin_room ?b) 1))
            ;(at start (bin-at ?b ?wp))
            (over all (binspot ?wp_bin))
        )

        :effect (and 
            (at end (and 
            (object-at ?obj ?wp_bin)
            (not (is_holding ?g ?obj))
            (placed ?obj)
            (free ?g)
            (decrease (bin_room ?b) 1)
            )
        )

        )
        )
    
    

    (:durative-action place_snack
        :parameters (?v - robot ?wp_shelf_snack - waypoint ?obj - object ?g - gripper ?ss - shelf_snack) 
        :duration (= ?duration 50)
        :condition (and
            ;(over all (robot-at ?v ?wp))
            (over all (robot-at ?v ?wp_shelf_snack))
            (at start (is_holding ?g ?obj))
            (at start (not-expired ?obj))
            (at start (heavy ?obj))
            (at start (snack ?obj))
            (at start (>= (snack_room ?ss) 1))
            ;(over all (shelfsnack-at ?ss ?wp))
            (over all (snackspot ?wp_shelf_snack))
        )

        :effect (and
            (at end (and 
            (object-at ?obj ?wp_shelf_snack)
            (not (is_holding ?g ?obj))
            (placed ?obj)
            (free ?g)
            (decrease (snack_room ?ss) 1)
            )
        )

        )
    )


    (:durative-action place_drink
        :parameters (?v - robot ?wp_shelf_drink - waypoint ?obj - object ?g - gripper ?sd - shelf_drink) 
        :duration (= ?duration 50)
        :condition (and
            ;(over all (robot-at ?v ?wp))
            (over all (robot-at ?v ?wp_shelf_drink))
            (at start (is_holding ?g ?obj))
            (at start (not-expired ?obj))
            (at start (heavy ?obj))
            (at start (drink ?obj))
            (at start (>= (drink_room ?sd) 1))
            ;(over all (shelfdrink-at ?sd ?wp))
            (over all (drinkspot ?wp_shelf_drink))
        )

        :effect (and
            (at end (and 
            (object-at ?obj ?wp_shelf_drink)
            (not (is_holding ?g ?obj))
            (placed ?obj)
            (free ?g)
            (decrease (drink_room ?sd) 1)
            )
        )

        )
    )

)