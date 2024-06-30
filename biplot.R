#Parameters you can adjust
pt_size=2
contrib_plot=T
ellipse=T

#To function for the biplot

biplot_allan=function(data,pca_res,var_plot,pt_size,contrib_plot=T,ellipse=T){
  require(ggpubr)
  grps=colnames(data)[2]
  grp_vec=as.factor(data[,2])
  data=data[,-c(1,2)]
  xplot <- var_plot[[4]]
  yplot <- var_plot[[5]]
  # Cleaning the plots
  
  xplot=xplot+xlab("")+theme_minimal()
  yplot <- yplot + ylab("Contribution (%)")+ xlab("")+rotate()
  
  
  
  y=fviz_pca_biplot(pca_res,
                    # Individuals
                    geom.ind = "point",
                    fill.ind = grp_vec, col.ind = "black",
                    pointshape = 21, pointsize = pt_size,
                    palette = "jco",
                    addEllipses = ellipse,
                    # Variables
                    alpha.var ="contrib", col.var = "contrib",
                    gradient.cols = "RdYlBu",
                    
                    legend.title = list(fill = grps, color = "Contrib",
                                        alpha = "Contrib")
  )
  
  
  
  y$labels$x=gsub("Dim","PC",y$labels$x)
  y$labels$y=gsub("Dim","PC",y$labels$y)
  
  z=ggarrange(xplot, NULL, y, yplot,
              ncol = 2, nrow = 2,  align = "hv",
              widths = c(2, 1), heights = c(1, 2),
              common.legend = TRUE)
  if(contrib_plot){
    return(z)
  }else{
    return(y)
  }
  
}



biplot=biplot_allan(data,pca_res,
                    pt_size=pt_size,
                    contrib_plot=contrib_plot,
                    ellipse=ellipse,
                    var_plot=variable_plot)

biplot