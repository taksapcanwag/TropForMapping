# Tropical forest mapping using high-resolution SAR and deep learning

This repository contains scripts and models used for the MSc thesis of Shoyo Nakamura at Wageningen University in the Netherlands.

## Table of Contents

- [About](#about)
- [Contributing](#contributing)
- [License](#license)

## About

Forest loss has been of increasing concern in the context of climate change and biodiversity losses, and thus effective forest monitoring is essential. Recently, high-resolution SAR images have become commercially available, which provides the potential to detect fine-scale forest changes. However, high-resolution SAR images have high intra-class and low inter-class variability with a single band, which makes it challenging for pixel-based machine learning to detect forest and non-forest. The rapid development of deep learning in recent years might provide the possibility to overcome this challenge as it can consider semantic features and effectively process a large amount of data. Aiming at exploring the potential and challenges of high-resolution SAR for forest mapping, this study employed land cover classification on a Capella image using pixel-based random forest (RF) and U-Net algorithms. First, novel reference datasets were created for the Capella image with three types of class categories: binary, multiple-class and sub-class. Next, land cover classifications were conducted using these models and datasets. For that, unweighted and weighted categorical crossentropy loss functions were used to investigate if the class imbalance in the datasets affects the model performances. The experimental results demonstrated the outperformance of U-Net over RF. The RF considered only individual pixel values and made poor performances for all the datasets. On the other hand, the U-Net model took into account the semantic texture, yielding outstanding results in the binary and multi-class datasets and acceptable results in the sub-class dataset. However, U-Net could not make sharp boundaries between different classes. Compared to the unweighted loss function, the weighted loss function gave higher metrics scores in the binary and multi-class datasets, but lower scores in the sub-class dataset. The comparison of RF and U-Net results suggests the usefulness of texture information rather than individual pixels to deal with the unique variability of pixel values within and between specific classes. Moreover, it would be important to take class balances in the training dataset into account to make model performances better. In this way, high-resolution SAR images can provide novel small-scale information. However, despite the high metrics scores of U-Net, it still has difficulty in keeping detailed information and distinguishing similar features, failing the sub-class segmentation and edge detection. Further research is necessary to discover the way to retain or recover information in high resolution while extracting distinct features of land semantics.


## Contributors

Shoyo Nakamura, Johannes Reiche, Adugna Mullissa (Wageningen University)

## License

Apache License 2.0
