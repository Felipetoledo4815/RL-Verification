import numpy as np
from dnnv.properties import *

N = Network("N")

# Cart Position; Cart Velocity; Pole Angle; Pole Angular Velocity
state = np.array([0, -0.03124355,  0.02901591,  0.04065558]).astype(np.float32)
param = Parameter("param", type=float, default=100)

Forall(
    x_,
    Implies(
        And(
            (-param <= x_[:,0] <= param),
            (state[1] <= x_[:,1] <= state[1]),
            (state[2] <= x_[:,2] <= state[2]),
            (state[3] <= x_[:,3] <= state[3]),
        ),
        (np.argmax(N(x_)) == np.argmax(N(state)))
    )
)