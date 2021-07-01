import plotly.express as px
import pandas as pd

A = np.random.uniform(low=0, high=5, size=(100,))
B = np.random.uniform(low=0, high=5, size=(100,))
C = np.random.uniform(low=0, high=5, size=(100,))

df = pd.DataFrame({'A':A, 'B':B, 'C':C})
fig = px.scatter_ternary(df, a="A", b="B", c="C")
fig.show()
