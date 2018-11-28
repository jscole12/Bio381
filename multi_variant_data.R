# PCA in FactoMineR and factorextra
# November 27 2018
# JSC

library(FactoMineR)
library(factoextra)

# PCA
#summarizes infor in multivaraite data sets in PCs
# rank PCs in order of variance they explain
# reduces dimensionality of data sets, loses least amount of info possible

# PCA
data("iris")
head(iris)

iris2 <- iris[1:4]

iris.pca <- PCA(iris2,scale.unit = TRUE, graph = FALSE)

iris.pca$eig

# Scree plot(factoextra)
fviz_screeplot(iris.pca,ncp=4)

# simple Factor map
plot.PCA(iris.pca,azes = c(1,2),choix = "var")

# factoextra biplot
fviz_pca(iris.pca)

fviz_pca_var(iris.pca,col.var = "contrib")

fviz_pca_var(iris.pca,col.var = "contrib") + 
  scale_color_gradient2(low="blue", mid = "steelblue", high = "red", midpoint = 25.0) + theme_void()

# individuals without labels
fviz_pca_ind(iris.pca,label = "none")


fviz_pca_ind(iris.pca,label = "none", habillage = iris$Species)

# ellipses
fviz_pca_ind(iris.pca,label = "none", habillage = iris$Species,
             addEllipses = TRUE, ellipse.level = .95)

#biplot with factoextra
fviz_pca_biplot(iris.pca,
                # individuals
                geom.ind = "point",
                fill.ind = iris$Species, col.ind = "black",
                pointshape = 21,
                pointsize = 2,
                addElipses = TRUE,
                # variables
                col.var = "contrib",
                # legends
                legend.title = list(fill = "Species",
                                    color = "contrib")) + 
  scale_color_gradient2(low = "blue",mid = "steelblue", high = "red")


