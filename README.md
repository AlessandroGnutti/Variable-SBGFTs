# Variable-SBGFTs

Modern compression systems use linear transformations in their encoding and decoding processes, with transforms providing compact signal representations. 
While multiple data-dependent transforms for image/video coding can adapt to diverse statistical characteristics, assembling large datasets to learn each transform is challenging.
Also, the resulting transforms typically lack fast implementation, leading to significant computational costs.
Thus, despite many papers proposing new transform families, the most recent compression standards predominantly use traditional separable sinusoidal transforms. 
This paper proposes integrating a new family of Symmetry-based Graph Fourier Transforms (SBGFTs) of variable sizes into a coding framework, focusing on the extension from our previously introduced 8x8 SBGFTs to the general case of NxN grids.
SBGFTs are non-separable transforms that achieve sparse signal representation while maintaining low computational complexity thanks to their symmetry properties.
Their design is based on our proposed algorithm, which generates symmetric graphs on the grid by adding specific symmetrical connections between nodes and does not require any data-dependent adaptation. Furthermore, for video intra-frame coding, we exploit the correlations between optimal graphs and prediction modes to reduce the cardinality of the transform sets, thus proposing a low-complexity framework. Experiments show that SBGFTs outperform the primary transforms integrated in the explicit Multiple Transform Selection (MTS) used in the latest VVC intra-coding, providing a bit rate saving percentage of 6.23%, with only a marginal increase in average complexity.

# Transform vectors

The transform vectors of the SBGFTs of size 4x4, 8x8, 16x16 and 32x32 can be found at: https://drive.google.com/drive/folders/1PHaRcjYabe7PJP0XC_aE3UTz4v09XlkY?usp=drive_link

Each .mat file contains a 3D matrix. The third dimension represents a specific graph. For each graph (that is, for each slice of the 3D matrix), the basis vectors of the corresponding graph are stored in the columns of the 2D matrix.


