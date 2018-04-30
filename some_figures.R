## Some Figures for My Slides on Beamer


library(tidyverse)
library(ggthemes)
data <- as.tibble(rnorm(1000))

data2 <- tibble(a=rnorm(1000), b=rnorm(1000), c=rnorm(1000)) %>% gather() %>% filter(value > -3 & value < 3)


cbscheme <- c("#E69F00", "#0072B2", "#D55E00")
cbschemefull <- c("#E69F00", "#0072B2", "#D55E00", "#009E73", "#CC79A7")


ggplot(data = data, aes(x=value)) + geom_line(stat = "density", color="#0072B2") + theme_tufte() + xlab("X-Axis Label") + ylab("Y-Axis Label")
ggsave("figure_badlabels.pdf")

ggplot(data = data, aes(x=value)) + geom_line(stat = "density", color="#0072B2") + theme_tufte() + xlab("X-Axis Label") + ylab("Y-Axis Label")
ggsave("figure_goodlabels.pdf", width = 5.6, height = 4.96, units="in")

ggplot(data = data, aes(x=value)) + geom_line(stat = "density", color="#0072B2") + theme_tufte(base_size = 22) + xlab("X-Axis Label") + ylab("Y-Axis Label")
ggsave("figure_bestlabels.pdf", width = 5.6, height = 4.96, units="in")


ggplot(data = data2 %>% filter(key == "a"), aes(x=value, color=key))  + geom_line(stat = "density") + 
  theme_tufte(base_size = 22) + xlab("X-Axis Label") + ylab("Y-Axis Label") +
  scale_colour_manual(values = c("#0072B2")) + theme(legend.position="none")  + ylim(c(0,0.45)) + xlim(c(-3,3))
ggsave("figure1_overlay.pdf", width = 5.6, height = 4.96, units="in")

ggplot(data = data2%>% filter(key == "a" | key == "b"), aes(x=value, color=key))  + geom_line(stat = "density") + 
  theme_tufte(base_size = 22) + xlab("X-Axis Label") + ylab("Y-Axis Label") +
  scale_colour_manual(values = c("#0072B2", "#D55E00")) + theme(legend.position="none") + ylim(c(0,0.45)) + xlim(c(-3,3))
ggsave("figure2_overlay.pdf", width = 5.6, height = 4.96, units="in")

ggplot(data = data2, aes(x=value, color=key))  + geom_line(stat = "density") + 
  theme_tufte(base_size = 22) + xlab("X-Axis Label") + ylab("Y-Axis Label") +
  scale_colour_manual(values = c("#0072B2", "#D55E00","#E69F00")) + theme(legend.position="none") + ylim(c(0,0.45)) + xlim(c(-3,3))
ggsave("figure3_overlay.pdf", width = 5.6, height = 4.96, units="in")
