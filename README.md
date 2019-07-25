## Welcome to ChromCon, the Chromatin Condensation Quantitative Analysis Project of the McCusker Lab

In this repository you can find the code corresponding to our [publication](https://doi.org/10.1371/journal.pone.0185292) **Sosnik, J., Vieira, W. A., Webster, K. A., Siegfried, K. R. and McCusker, C. D.** (2017). A New and Improved Algorithm for the Quantification of Chromatin Condensation from Microscopic Data Shows Decreased Chromatin Condensation in Regenerating Axolotl Limb Cells. *PLoS ONE12(10): e0185292*. We hope that you make use of our tools for your research. If you do, please cite our paper. 

All the files are provided under the BSD 3-Clause License. You can access the terms on the [license](https://github.com/McCuskerLab/ChromCon/blob/master/LICENSE.md) here.

There are two tools that we have made available here. The first one, [Crop&Split](https://github.com/McCuskerLab/ChromCon/blob/master/Crop%26Split.ijm) is an ImageJ macro that allows you to mark an area in your z-stack and creates a new image with only the region selected in a loss-less fashion. Instructions about download, installation and how to use the tool can be found in the [Crop&Split_Instructions](https://mccuskerlab.github.io/ChromCon/Crop%26Split_Instructions) file. This tool makes it easy to split your image stacks into folders with individual z planes that you can use as a starting point for the ChromCond tool.

The Second tool is called [ChromCond](https://github.com/McCuskerLab/ChromCon/blob/master/ChromCond.m) and is the tool that performs quantitative analysis of chromatin condensation. This is a MATLAB tool but we have also provided a compiled version that you can download a use freely, even if you don't have a MATLAB license. Instructions about download, installation and how to use the different versions of the tool can be found in the [ChromCond_Instructions](https://mccuskerlab.github.io/ChromCon/ChromCond_Instructions) file.

