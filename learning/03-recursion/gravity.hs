-- This program calculates the gravity of the earth given its radious

-- This is ugly way to do the things
gravity :: (Fractional a) => a -> a
gravity r = 6.674e-11 * 5.972e24 / (r ^ 2)

-- Using label for constants within let block
-- g and earthMass can be made global but it is better to
-- have variable names within as local scope as possible
gravity2 :: (Fractional a) => a -> a
gravity2 r = let g = 6.674e-11          -- g is the Universal gravitation constant
                 earthMass = 5.972e24   -- earthMass - weight of the earth
             in g * earthMass / (r ^ 2)

