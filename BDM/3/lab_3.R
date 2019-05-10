#install.packages("dplyr")

#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)
anscombe
str(anscombe)	
summary(anscombe)	
cor.test(anscombe$x1,anscombe$y1)
cor.test(anscombe$x2,anscombe$y2)
cor.test(anscombe$x3,anscombe$y3)
cor.test(anscombe$x4,anscombe$y4)
lm1 <- lm(data = anscombe, y1 ~ x1)
lm2 <- lm(data = anscombe, y2 ~ x2)
lm3 <- lm(data = anscombe, y3 ~ x3)
lm4 <- lm(data = anscombe, y4 ~ x4)
lm1$fitted.values
lm2$fitted.values
lm3$fitted.values
lm4$fitted.values
anscombe$y1 - lm1$fitted.values
anscombe$y2 - lm1$fitted.values
anscombe$y3 - lm1$fitted.values
anscombe$y4 - lm1$fitted.values
lm1$residuals
lm2$residuals
lm3$residuals
lm4$residuals
anscombe$residuals_lm1 <- lm1$residuals
ggplot(anscombe, aes(x = residuals_lm1)) + geom_dotplot(fill ="orange")

anscombe$residuals_lm2 <- lm2$residuals
ggplot(anscombe, aes(x = residuals_lm2)) + geom_dotplot(fill ="orange")

anscombe$residuals_lm3 <- lm3$residuals
ggplot(anscombe, aes(x = residuals_lm3)) + geom_dotplot(fill ="orange")

anscombe$residuals_lm4 <- lm4$residuals
ggplot(anscombe, aes(x = residuals_lm4)) + geom_dotplot(fill ="orange")

qqnorm(lm1$residuals, col="orange", pch=20)
qqline(lm1$residuals, col = "blue")

qqnorm(lm2$residuals, col="red", pch=20)
qqline(lm2$residuals, col = "blue")

qqnorm(lm3$residuals, col="purple", pch=20)
qqline(lm3$residuals, col = "blue")

qqnorm(lm4$residuals, col="green", pch=20)
qqline(lm4$residuals, col = "blue")

anscombe$fitted_lm1 <- lm1$fitted.values
ggplot(data=anscombe, aes(x=fitted_lm1, y=residuals_lm1)) + geom_point(col="darkred")

anscombe$fitted_lm3 <- lm3$fitted.values
ggplot(data=anscombe, aes(x=fitted_lm3, y=residuals_lm3)) + geom_point(col="darkred")

anscombe$fitted_lm4 <- lm4$fitted.values
ggplot(data=anscombe, aes(x=fitted_lm4, y=residuals_lm4)) + geom_point(col="darkred")

str(diamonds)

ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(col="lightblue")

ggplot(data=diamonds, aes(x=carat, y=price, col=cut)) + geom_point()

ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(col="lightblue") + facet_wrap(~cut)

ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(col="lightgreen") + geom_smooth(method="lm", se=FALSE) + facet_wrap(~cut)

ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(col="lightgreen")  + geom_smooth(method="lm", se=FALSE) + xlab("Weight (carats)") + xlim(0.2, 1)
