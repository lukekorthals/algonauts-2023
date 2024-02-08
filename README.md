# algonauts-2023
We took part in the algonauts project 2023 http://algonauts.csail.mit.edu/ and attempted to predict fMRI responses to images with CLIP representations. 

# File Overview
- _report.html_ - Final report containing some background, our pipelines, and results
- _report.ipynb_ - Run this jupyter notebook to investigate specific brain regions or replicate our results

# Abstract
Recent advances in machine learning have enabled the development of computational models that can predict brain responses to visual stimuli. In this study, we investigate the effectiveness of the CLIP (Contrastive Language-Image Pre-Training) model. This is a state-of-the-art neural network model developed by OpenAI to predict brain activation across the whole brain in response to image stimuli in the Algonauts 2023 Challenge. We proposed three CLIP-based solutions: a Text model, a Vision model, and a combination of features from the Text and Vision models. We hypothesized that a combination of features from the Text and Vision models would provide the best approximation of the brain responses. The data consists of fMRI recordings from participants viewing complex natural visual scenes. This combination of features will be able to effectively recognize objects and infer relationships between them by leveraging its cross-modal understanding. The results showed that the Text model was the worst performing model to predict brain activation, while the Vision model outperformed the other models. Unexpectedly, the Combination model performed equal or worse than the Vision model. As our final solution to the Algonauts 2023 Challenge, we propose combining layer 4 and 8 of the CLIP Vision model. Our findings suggest that the CLIP Vision model provides a more effective approach for predicting brain activation in response to visual stimuli than either the Text model or Combination model, particulary for the early layers.

# Most Important Results

**Image Encoder Models**
- Earlier layers of the CLIP Image Encoder predict lower visual cortex (V1-V3) best, while later layers predict higher visual cortex areas best.
- The best overall model for early visual cortex (V1-V3) was Transformer Layer 4.
- The best overall model for the rest of the cortex was Transformer Layer 8.
- The best overall single layer model for the entire cortex was Transformer Layer 7.
- The best overal model for the entire cortex was a combination of Transformer Layer 4 and Transformer Layer 8.
![image](https://github.com/lukekorthals/algonauts-2023/blob/main/plots/8-fold%20cross%20validation%20vision%20model%20pca%20200%20all%20layers.png)

**Text Encoder Models**
- Later layers of the CLIP Text Encoder predict all investigated areas better than ealier layers.
- The best Text Encoder model was Transformer Layer 11, however it performed a lot worse than the Image Encoder Models, particularly for the early visual cortex (V1-V3).
![image](https://github.com/lukekorthals/algonauts-2023/blob/main/plots/8-fold%20cross%20validation%20text%20model%20pca%20200%20all%20layers.png)

**Combined Models**
- The combined models performed as good or worse than the best Image Encoder models. 
- Similar to the Image Encoder models, the combination of Image Encoder Layer 7 and Text Encoder Layer 7 performed was the best combined model.
- Combining the best Image Encoder models for early and higher visual cortex with the best Text Encoder Model (i.e., Image Layer 4 + Image Layer 8 + Text Layer 11) performed worse than the best performing Image Encoder Model (i.e., Image Layer 4 + Image Layer 8).

![image](https://github.com/lukekorthals/algonauts-2023/blob/main/plots/8-fold%20cross%20validation%20combined%20model%20comb_pca%20200%20all%20layers.png)
