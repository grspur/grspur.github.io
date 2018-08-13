---
title: "Genie Bouchard and tennis Elo ratings"
author: "Guy Spurrier"
date: '2018-01-19'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, message = FALSE)
```

When the next WTA rankings come out on Jan. 29, Eugenie Bouchard will have a doubles ranking that is higher than her singles ranking. Since she rarely plays doubles, it's a pretty stark picture of the state of her game. 

The last time she was outside the top 100 was March 2013. She came into the Australian Open ranked 112th in the world because the ranking points she had earned by making the semifinals in Sydney last year, which she was unable to replicate losing in the first round of a lesser warmup tournament in Hobart. It was a precipitous drop even from her 2017 year-end No. 83. 

On Jan. 29, Bouchard will likely fall to around 119th according to the calculations at Live-Tennis.eu. Despite losing in first-round doubles with CoCo Vandeweghe this week, Bouchard's doubles ranking will be in the neighbourhood of 109. 

Bill Parcells, the old NFL coach, once famously said, "We are what our record says we are." 

There are likely a lot of her fans, and perhaps many professional observers and commentators, who see the 23-year-old as a top-20 player struggling to regain that lofty form. Is that even fair to her anymore, to hold her to what is now a 3 1/2-year-old expectation? 

Jeff Sackmann's TennisAbstract.com has <a href="http://tennisabstract.com/reports/wta_elo_ratings.html">Elo ratings</a> for current players, which present a ranking snapshot not just of wins and losses but one that takes into account the quality of opponent. 

Bouchard's Elo ranking coming into 2018 was 101st. Her peak 2014 Elo of 2154.2 points would put her in the current top 10. And while the difference between her peak Elo and her current Elo is among the worst on the current list, she is not unique. 

Below is a chart of the 174 players on Sackmann's current Elo list, plotted with current Elo versus peak Elo. 

```{r, fig.width = 8, fig.height = 8}

library(tidyverse)
library(lubridate)
library(stringr)
library(RColorBrewer)
library(readr)

quartzFonts(ANXTC = c("Avenir Next Condensed Regular", "Avenir Next Condensed Demi Bold", "Avenir Next Condensed Italic", "Avenir Next Condensed Demi Bold Italic"))

tenElo <- read_csv("~/Documents/R/Data files/Tennis/TennisEloWTA.csv")

tenElo$Diff <- tenElo$Peak.elo - tenElo$Elo

tenPlot <- ggplot(tenElo) +
  geom_point(aes(x = Elo, y = Peak.elo), colour = "grey60") +
  theme_minimal() +
  theme(text = element_text(family = "ANXTC"), plot.title = element_text(size = 16, face = "bold"), plot.subtitle = element_text(size = 13, face = "plain"), axis.title.x = element_text(size = 13, face = "plain"), axis.title.y = element_text(size = 13, face = "plain"), axis.text.x = element_text(size = 12, face = "plain"), axis.text.y = element_text(size = 12, face = "plain")) +
  labs(title = "Elo: Don't bring me down", subtitle = "Current Elo vs. Peak Elo for 174 WTA players", x = "Current Elo", y = "Peak Elo", caption = "Data source: TennisAbstract.com  |  Postmedia Sports") +
  scale_x_continuous(minor_breaks = NULL) +
  scale_y_continuous(breaks = c(1600,1800,2000,2200,2400), minor_breaks = NULL) +
  annotate("pointrange", x = 1762.8, y = 2154.2, ymin = 2154.2, ymax = 2154.2, colour = "red") +
  annotate("text", x = 0.9875 * c(1818.9, 2102.6, 1766.3, 1768.5, 1632.4, 1798.9, 1936.6, 1725.4, 1769.7, 1892.4, 1803.9, 1666.4, 1757), y = c(2330.8, 2548.3, 2188, 2183.3, 2039.9, 2193.9, 2323.1, 2111.8, 2140, 2250.9, 2156, 2014.4, 2071.9), label = c(1:13), size = 4, hjust = 0, vjust = 0, colour = "black", family = "ANXTC", fontface = "bold") +
  annotate("text", x = 2100, y = 2000, label = "7. Ana Ivanovic\n8. Alexandra Dulgheru\n9. Francesca Schiavone\n10. Samantha Stosur\n11. Sara Errani\n12. Anna Karolina Schmiedlova\n13. Mona Barthel", size = 4, hjust = 0, vjust = 1, colour = "grey60", family = "ANXTC", fontface = "bold") +
  annotate("text", x = 1410, y = 2550, label = "1. Jelena Jankovic\n2. Venus Williams\n3. Daniela Hantuchova\n4. Andrea Petkovic\n5. Tamira Paszek\n6. Yanina Wickmayer", size = 4, hjust = 0, vjust = 1, colour = "grey60", family = "ANXTC", fontface = "bold")

tenPlot
```

Bouchard, the red dot, is certainly outside the mass because of her nearly 400-point difference. It is unusual but not unique. The chart annotates the position and names of the 13 other players who have at least a 300-point difference between current and peak Elo. 

Some of these names are aging players nearing the ends of their careers: Jelena Jankovic, Francesca Schiavone and Sara Errani. Ana Ivanovic and Daniela Hantuchova recently retired. 

But some are comparable to Bouchard. Tamira Paszek wasn't able to live up to an early blast to the top and is now attempting to come back from injury and a <a href="http://www.wtatennis.com/news/tamira-paszek-trigeminal-neuralgia-recovery-inspired-venus-rogers-cup-2018-comeback?utm_source=Direct">recent diagnosis</a> of trigeminal neuralgia. Andrea Petkovic and Yanina Wickmayer haven't followed up early promise either for various reasons. 

People may point to Bouchard's accident in the locker room at the 2015 U.S. Open as the dividing line between the real Bouchard and the one who competes now. Only she and her team know if that is true. We'll never know, until she tells us, whether the ongoing lawsuit over the incident weighs on her. 

The expectations of a better Bouchard offer ample opportunity for critics to make laughable accusations. The arbitrary assignment of blame for the state of her game — she has too many marketing commitments outside tennis, she spends too much time on social media — aren't ones you would level at a player outside the top 100. A Russian tennis writer said on Twitter that former world No. 5 Anna Chakvetadze, while working Bouchard's match against Simona Halep earlier today for a European network, claimed Bouchard isn't focused when she practises. 

https://twitter.com/Shahovez/status/953917938809139201

Chakvetadze definitely doesn't scope out the Twitter and Instagram feeds of innumerable other high-profile players. Posting shots of workouts and practices is a staple of the genre. 

But that's not to single out Chakvetadze here. (To be fair, there's no corroboration of her comment.) There are legions willing to tell Bouchard what she's doing wrong with her life. 
Dropping out of the top 100 seems like a good time to recalibrate public expectations of Eugenie Bouchard's professional life. She is what her record says she is. 
