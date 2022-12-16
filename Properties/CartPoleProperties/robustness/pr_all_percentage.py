import numpy as np
from dnnv.properties import *

N = Network("N")

# Cart Position; Cart Velocity; Pole Angle; Pole Angular Velocity
state = np.array([-0.1, -0.1,  0.1,  0.1]).astype(np.float32)
epsilon = Parameter("epsilon", type=float, default=10) / 100

Forall(
    x_,
    Implies(
        And(
            (state[0] - abs(state[0] * epsilon) <= x_[:,0] <= state[0] + abs(state[0] * epsilon)),
            (state[1] - abs(state[1] * epsilon) <= x_[:,1] <= state[1] + abs(state[1] * epsilon)),
            (state[2] - abs(state[2] * epsilon) <= x_[:,2] <= state[2] + abs(state[2] * epsilon)),
            (state[3] - abs(state[3] * epsilon) <= x_[:,3] <= state[3] + abs(state[3] * epsilon)),
        ),
        (np.argmax(N(x_)) == np.argmax(N(state)))
    )
)