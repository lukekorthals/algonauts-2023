import numpy as np
import torch 

# initialize vector (9000, 50, 768)
features = np.zeros((9000, 50, 768))
features2 = np.zeros((9000, 50, 768))

# stack the vectors
features3 = np.hstack((features, features2))
print(features3.shape)
print(torch.tensor(features3).flatten(1).shape)
print(np.hstack((torch.tensor(features).flatten(1).numpy(), torch.tensor(features2).flatten(1).numpy())).shape)