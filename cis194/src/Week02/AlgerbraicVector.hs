-- | Type systems help reduce bugs

module Week02.AlgerbraicVector where

-- x and y coordinates or lengths.
data Cartesian2D = Cartesian2D Double Double
                 deriving (Eq, Show)

-- Ange and distance (magnitude).
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)

