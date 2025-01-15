(define (domain albert-does-stuff)

    (:requirements
        :typing
        :durative-actions
        :negative-preconditions
        :disjunctive-preconditions
        )

    (:types
        waypoint
        robot
        object
        gripper
    )
    
    (:predicates
        (visited ?wp - waypoint) ; To define which states the robot has already visited
        (robot-at ?v - robot ?wp - waypoint) ; To define which robot is at which waypoint
        (object-at ?obj - object ?wp - waypoint) ; To define which object is at which waypoint
        (is_holding ?g - gripper ?obj - object) ; To define which gripper is holding which object
        (free ?g - gripper) ; To define which gripper is free. This is needed to simplify if the gripper is engaged or not. Without this, you would have to loop through all objects
        (object_placed ?obj - object ?wp - waypoint) ; To define if an object is placed at its destination
    )
    
    (:durative-action move
    
    ; Move is the action of the robot moving Without anything in its grippers
    
        :parameters (?v - robot ?from ?to - waypoint ?g - gripper)
        :duration ( = ?duration 2)
        :condition (and
            (at start (robot-at ?v ?from))
            (at start (free ?g))
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
    
    ; Pick is the action of picking up an object. The gripper is no longer free and holds the object 
    
        :parameters (?v - robot ?wp - waypoint ?obj - object ?g - gripper)
        :duration (= ?duration 2)
        :condition (and
        
        (at start (robot-at ?v ?wp))
        (at start (object-at ?obj ?wp))
        (at start (free ?g))
        )
        
        :effect (and
        (at end (is_holding ?g ?obj))
        (at end (not (free ?g)))
        )

    )
    
    
    (:durative-action carry
    
    ; Carry is the action of the robot moving with the object in its gripper
    
        :parameters (?v - robot ?from ?to - waypoint ?obj - object ?g - gripper)
        :duration ( = ?duration 2)
        :condition (and
            (at start (robot-at ?v ?from))
            (at start (object-at ?obj ?from))
            (at start (is_holding ?g ?obj))
        )
        :effect (and
            (at end (visited ?to))
            (at end (robot-at ?v ?to))
            (at end (object-at ?obj ?to))
            (at start(not
                (robot-at ?v ?from)
            ))
            
            (at start(not
                (object-at ?obj ?from)
            ))
            
        )
    )
    
    
    (:durative-action place
    
    ; Place is the action of the robot putting down the object in hand at the specified waypoint
    
        :parameters (?v - robot ?wp - waypoint ?obj - object ?g - gripper)
        :duration (= ?duration 2)
        :condition (and
        
        (at start (robot-at ?v ?wp))
        (at start (object-at ?obj ?wp))
        (at start (is_holding ?g ?obj))
        )
        
        :effect (and
        (at end (not (is_holding ?g ?obj)))
        (at end (free ?g))
        (at end (object_placed ?obj ?wp))
        )

    )
    
    ; (:durative-action discard
    ;     :parameters (?v - robot ?wp - waypoint ?obj - object ?g - gripper ?b - bin)
    ;     :duration (= ?duration 2)
        
    ;     ; PRECONDITIONS:
    ;     ; - robot is at some waypoint
    ;     ; - bin is at the same waypoint
    ;     ; - gripper is not free
    ;     ; - gripper is holding the object
    ;     ; - object is expired OR object is empty
    ;     ; - bin is not full        
        
    ;     :condition (and
        
    ;     (at start (robot-at ?v ?wp))
    ;     (at start (bin-at ?b ?wp))
    ;     (at start (object-at ?obj ?wp))
    ;     ; (at start (not (free ?g)))
    ;     (at start (is_holding ?g ?obj))
    ;     (at start (or (expired ?obj) (empty ?obj)))
    ;     (at start (not (full ?b)))
    ;     (at start (not(in_bin ?obj)))
    ;     )
        
    ;     :effect (and
    ;     (at end (not (is_holding ?g ?obj)))
    ;     (at end (free ?g))
    ;     ; (at end (object-at ?obj ?wp))
    ;     (at end (in_bin ?obj))
    ;     ; some predicate defining 'place'
        
    ;     )

    ; )

)

