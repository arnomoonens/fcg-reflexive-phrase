(asdf:operate 'asdf:load-op 'fcg-light)
(in-package :fcg-light)
(activate-monitor trace-fcg-light)


(def-fcg-constructions basic-grammar
                       :feature-types ((args sequence)
                                       (form set-of-predicates)
                                       (meaning set-of-predicates)
                                       (constituents sequence)
                                       (sem-class set)
                                       (person set))
                       :hierarchy-features '(constituents)

                       ;Subjects
                       (def-fcg-cxn ik-cxn
                                    ((?ik-word
                                       (referent ?x)
                                       (syn-cat (lex-cat pronoun)
                                                (person first)
                                                (number singular)))
                                     <-
                                     (?ik-word
                                       (HASH meaning ((me ?x)))
                                       --
                                       (HASH form ((string ?ik-word  "ik")))))
                                     )

                       (def-fcg-cxn jij-cxn
                                    ((?jij-word
                                       (referent ?x)
                                       (syn-cat (lex-cat pronoun)
                                                (person second)
                                                (number singular)))
                                     <-
                                     (?jij-word
                                       (HASH meaning ((you-singular ?x)))
                                       --
                                       (HASH form ((string ?jij-word  "jij")))))
                                     )

                       (def-fcg-cxn hij-cxn
                                    ((?hij-word
                                       (referent ?x)
                                       (sem-cat (sem-class (physobj animate masculine))
                                                (sem-function referring))
                                       (syn-cat (lex-cat pronoun)
                                                (person third)
                                                (number singular)))
                                     <-
                                     (?hij-word
                                       (HASH meaning ((he ?x)))
                                       --
                                       (HASH form ((string ?hij-word  "hij")))))
                                     )

                       (def-fcg-cxn wij-cxn
                                    ((?wij-word
                                       (referent ?x)
                                       (syn-cat (lex-cat pronoun)
                                                (person first)
                                                (number plural)))
                                     <-
                                     (?wij-word
                                       (HASH meaning ((we ?x)))
                                       --
                                       (HASH form ((string ?wij-word  "wij")))))
                                     )

                       (def-fcg-cxn jullie-cxn
                                    ((?jullie-word
                                       (referent ?x)
                                       (syn-cat (lex-cat pronoun)
                                                (person second)
                                                (number plural)))
                                     <-
                                     (?jullie-word
                                       (HASH meaning ((you-multiple ?x)))
                                       --
                                       (HASH form ((string ?jullie-word  "jullie")))))
                                     )

                       (def-fcg-cxn zij-plural-cxn
                                    ((?zij-plural-word
                                       (referent ?x)
                                       (syn-cat (lex-cat pronoun)
                                                (person third)
                                                (number plural)))
                                     <-
                                     (?zij-plural-word
                                       (HASH meaning ((them ?x)))
                                       --
                                       (HASH form ((string ?zij-plural-word  "zij")))))
                                     )

                       ;Verbs

                       (def-fcg-cxn was-cxn
                                    ((?was-unit
                                       (args (?x ?wasser ?gewaste))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense present)
                                                (person first)
                                                (number singular)))
                                     <-
                                     (?was-unit
                                       (HASH meaning ((wassen ?x) (wasser ?x ?wasser) (gewaste ?x ?gewaste) (first-person ?x)))
                                       --
                                       (HASH form ((string ?was-unit "was")))))
                                     )


                       (def-fcg-cxn wast-second-cxn
                                    ((?wast-unit
                                       (args (?x ?wasser ?gewaste))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense present)
                                                (person ?person)
                                                (number singular)))
                                     <-
                                     (?wast-unit
                                       (HASH meaning ((wassen ?x) (wasser ?x ?wasser) (gewaste ?x ?gewaste) (second-third-person ?x)))
                                       --
                                       (HASH form ((string ?wast-unit "wast")))))
                                     )


                       (def-fcg-cxn wassen-cxn
                                    ((?wassen-unit
                                       (args (?x ?wassers ?gewaste))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wassers)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense present)
                                                (number plural)
                                                (person ?person)))
                                     <-
                                     (?wassen-unit
                                       (HASH meaning ((wassen ?x) (wassers ?x ?wassers) (gewaste ?x ?gewaste) ))
                                       --
                                       (HASH form ((string ?wassen-unit "wassen")))))
                                     )

                       ;Reflexive pronouns

                       (def-fcg-cxn me-cxn
                                    ((?me-word
                                       (referent ?x)
                                       (syn-cat (lex-cat reflexivepn)
                                                (person first)
                                                (number singular)
                                                ))
                                     <--
                                     (?me-word
                                       (HASH meaning ((reflexive-me ?x)))
                                       --
                                       (HASH form ((string ?me-word  "me"))))
                                     )
                                     )

                       (def-fcg-cxn je-cxn
                                    ((?je-word
                                       (referent ?x)
                                       (syn-cat (lex-cat reflexivepn)
                                                (person second)
                                                (number ?number)
                                                ))
                                     <--
                                     (?je-word
                                       (HASH meaning ((reflexive-you ?x)))
                                       --
                                       (HASH form ((string ?je-word  "je"))))
                                     )
                                     )

                       (def-fcg-cxn zich-cxn
                                    ((?zich-word
                                       (referent ?x)
                                       (syn-cat (lex-cat reflexivepn)
                                                (person third)
                                                (number ?number)
                                                ))
                                     <--
                                     (?zich-word
                                       (HASH meaning ((reflexive-other-s ?x)))
                                       --
                                       (HASH form ((string ?zich-word  "zich"))))
                                     )
                                     )

                       (def-fcg-cxn ons-cxn
                                    ((?ons-word
                                       (referent ?x)
                                       (syn-cat (lex-cat reflexivepn)
                                                (person first)
                                                (number plural)
                                                ))
                                     <--
                                     (?ons-word
                                       (HASH meaning ((reflexive-we ?x)))
                                       --
                                       (HASH form ((string ?ons-word  "ons"))))
                                     )
                                     )



                       (def-fcg-cxn rp-cxn
                                    ((?rp-unit
                                       (referent ?subject)
                                       (syn-cat
                                                (number-agreement ?number)
                                                (person-agreement ?person))
                                       (constituents (?pronoun-unit ?verb-unit ?reflexive-unit)))
                                     <-
                                     (?rp-unit
                                       --
                                       (HASH form ((meets ?pronoun-unit ?verb-unit)
                                                   (meets ?verb-unit ?reflexive-unit))))
                                     (?pronoun-unit
                                       (referent ?subject)
                                       --
                                       (syn-cat (lex-cat pronoun)
                                                (number ?number)
                                                (person ?person)))
                                     (?verb-unit
                                       (args (?x ?subject ?subject))
                                       (sem-cat (sem-class ?sem-class))
                                       --
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense present)
                                                (number ?number)
                                                (person ?person)))
                                     (?reflexive-unit
                                       (referent ?subject)
                                       --
                                       (syn-cat (lex-cat reflexivepn)
                                                (number ?number)
                                                (person ?person)))
                                     )
                                     )

                       (def-fcg-cxn gewassen-cxn
                                    ((?gewassen-unit
                                       (args (?x ?wasser ?gewaste))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense past)))
                                     <-
                                     (?gewassen-unit
                                       (HASH meaning ((gewassen ?x) (wasser ?x ?wasser) (gewaste ?x ?gewaste)))
                                       --
                                       (HASH form ((string ?gewassen-unit "gewassen")))))
                                     )

                       (def-fcg-cxn heb-cxn
                                    ((?heb-unit
                                       (args (?x))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type auxiliary)
                                                (tense present)
                                                (person first)
                                                (number singular)))
                                     <-
                                     (?heb-unit
                                       (HASH meaning ((hebben ?x) (first-person ?x) (singular ?x)))
                                       --
                                       (HASH form ((string ?heb-unit "heb")))))
                                     )

                       (def-fcg-cxn hebt-cxn
                                    ((?hebt-unit
                                       (args (?x))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type auxiliary)
                                                (tense present)
                                                (person second)
                                                (number singular)))
                                     <-
                                     (?hebt-unit
                                       (HASH meaning ((hebben ?x) (second-person ?x) (singular ?x)))
                                       --
                                       (HASH form ((string ?hebt-unit "hebt")))))
                                     )

                       (def-fcg-cxn heeft-cxn
                                    ((?heeft-unit
                                       (args (?x))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type auxiliary)
                                                (tense present)
                                                (person third)
                                                (number singular)))
                                     <-
                                     (?heeft-unit
                                       (HASH meaning ((hebben ?x) (third-person ?x) (singular ?x)))
                                       --
                                       (HASH form ((string ?heeft-unit "heeft")))))
                                     )

                       (def-fcg-cxn hebben-cxn
                                    ((?hebben-unit
                                       (args (?x))
                                       (sem-cat (sem-class (event))
                                                (sem-valence (actor ?wasser)
                                                             (undergoer ?gewaste)))
                                       (syn-cat (lex-cat verb)
                                                (verb-type auxiliary)
                                                (tense present)
                                                (person ?person)
                                                (number plural)))
                                     <-
                                     (?hebben-unit
                                       (HASH meaning ((hebben ?x) (plural ?x)))
                                       --
                                       (HASH form ((string ?hebben-unit "hebben")))))
                                     )

                       (def-fcg-cxn pprp-cxn
                                    ((?pprp-unit
                                       (referent ?subject)
                                       (syn-cat
                                                (number-agreement ?number)
                                                (person-agreement ?person))
                                       (constituents (?pronoun-unit ?have-unit ?reflexive-unit ?verb-unit)))
                                     <-
                                     (?pprp-unit
                                       --
                                       (HASH form (
                                                   (meets ?pronoun-unit ?have-unit)
                                                   (meets ?have-unit ?reflexive-unit)
                                                   (meets ?reflexive-unit ?verb-unit))))
                                     (?pronoun-unit
                                       (referent ?subject)
                                       --
                                       (syn-cat (lex-cat pronoun)
                                                (number ?number)
                                                (person ?person)))
                                     (?have-unit
                                       (args (?x))
                                       --
                                       (syn-cat (lex-cat verb)
                                                (verb-type auxiliary)
                                                (number ?number)
                                                (person ?person)))
                                     (?verb-unit
                                       (args (?x ?subject ?subject))
                                       (sem-cat (sem-class ?sem-class))
                                       --
                                       (syn-cat (lex-cat verb)
                                                (verb-type regular)
                                                (tense past)))
                                     (?reflexive-unit
                                       (referent ?subject)
                                       --
                                       (syn-cat (lex-cat reflexivepn)
                                                (number ?number)
                                                (person ?person)))
                                     )
                                     )
                       )


; (comprehend '("ik" "was" "me"))
; (comprehend '("jij" "wast" "je"))
; (comprehend '("wij" "wassen" "ons"))
; (comprehend '("jullie" "wassen" "je"))
(comprehend '("zij" "wassen" "zich"))
(formulate '((me p) (verb event) (wasser event p) (gewaste event p) (wassen event) (reflexive-me p) (first-person event)))
; (formulate '((you-singular p) (verb event) (wasser event p) (gewaste event p) (wassen event) (reflexive-you p) (second-third-person event)))
; (formulate '((male-person p) (verb event) (wasser event p) (gewaste event p) (wassen event) (reflexive-other-s p) (second-third-person event)))
; (formulate '((we p) (verb event) (wassers event p) (gewaste event p) (wassen event) (reflexive-we p)))
; (formulate '((you-multiple p) (verb event) (wassers event p) (gewaste event p) (wassen event) (reflexive-you p)))
; (formulate '((them p) (verb event) (wassers event p) (gewaste event p) (wassen event) (reflexive-other-s p)))

; (comprehend '("ik" "heb" "me" "gewassen"))
; (comprehend '("jij" "hebt" "je" "gewassen"))
; (comprehend '("hij" "heeft" "zich" "gewassen"))
; (comprehend '("wij" "hebben" "ons" "gewassen"))
; (comprehend '("jullie" "hebben" "je" "gewassen"))
(comprehend '("zij" "hebben" "zich" "gewassen"))

(formulate '((hebben event) (first-person event) (singular event) (me p) (reflexive-me p) (gewassen event) (wasser event p) (gewaste event p)))
; (formulate '((hebben event) (second-person event) (singular event) (you-singular p) (reflexive-you p) (gewassen event) (wasser event p) (gewaste event p)))
; (formulate '((hebben event) (third-person event) (singular event) (male-person p) (reflexive-other-s p) (gewassen event) (wasser event p) (gewaste event p)))
; (formulate '((hebben event) (first-person event) (plural event) (we p) (reflexive-we p) (gewassen event) (wasser event p) (gewaste event p)))
; (formulate '((hebben event) (second-person event) (plural event) (you-multiple p) (reflexive-you p) (gewassen event) (wasser event p) (gewaste event p)))
; (formulate '((hebben event) (third-person event) (plural event) (them p) (reflexive-other-s p) (gewassen event) (wasser event p) (gewaste event p)))