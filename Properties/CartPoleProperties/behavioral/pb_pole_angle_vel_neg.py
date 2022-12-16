import numpy as np
from dnnv.properties import *

N = Network("N")

# Cart Position; Cart Velocity; Pole Angle; Pole Angular Velocity

Forall(
    x_,
    Implies(
        And(
            (-10 <= x_[:,0] <= 10),
            (0 <= x_[:,1] <= 0),
            (0 <= x_[:,2] <= 0),
            (-2 <= x_[:,3] <= -0.5),
        ),
        (np.argmax(N(x_)) == 0)
    )
)