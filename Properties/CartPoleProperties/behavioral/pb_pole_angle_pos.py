import numpy as np
from dnnv.properties import *

N = Network("N")

# Cart Position; Cart Velocity; Pole Angle; Pole Angular Velocity
# Pole angle in Rad (5.72958 deg to 28.6479 deg)

Forall(
    x_,
    Implies(
        And(
            (-10 <= x_[:,0] <= 10),
            (0 < x_[:,1] < 0),
            (0.1 < x_[:,2] < 0.5),
            (0 < x_[:,3] < 0),
        ),
        (np.argmax(N(x_)) == 1)
    )
)