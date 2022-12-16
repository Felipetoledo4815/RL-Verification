import numpy as np
from dnnv.properties import *

N = Network("N")

# Cart Position; Cart Velocity; Pole Angle; Pole Angular Velocity
state = np.array([-0.1, -0.1,  0.1,  0.1]).astype(np.float32)
param = Parameter("param", type=float, default=1)

Forall(
    x_,
    Implies(
        And(
            (state[0] <= x_[:,0] <= state[0]),
            (state[1] <= x_[:,1] <= state[1]),
            (state[2] <= x_[:,2] <= state[2]),
            (state[3] - param <= x_[:,3] <= state[3] + param),
        ),
        (np.argmax(N(x_)) == np.argmax(N(state)))
    )
)