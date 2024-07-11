library(exams)

# Procedure for Moodle/Stream:

# 1. Import. Set Moodle/XML format, select File -> Go.
# 2. To delete, click on the full category (not sub categories) so all questions are shown, select all -> delete -> confirm.
# 3. Preview everything...

# Creating quiz
# 1. New Quiz
# 2. Make hidden (obvs)
# 3. Timing -> set time limit. Make sure time limit is in description.
# 4. Layout -> all on one page, as shown on dit screen
# 5. Behaviour -> No shuffle within questions, Deferred feedback, NO attempt builds on last
# 6. Activity completion setup correctly to "Show activity as complete when conditions are met" and "Student must receive a grade"
# 7. Show description on page.
# 8. Add questions via Add random question...
# 9. Select Shuffle.
# 10. Update total marks.
# 11. Preview...
# 12. Make visible

set.seed(2024)
library(tidyverse)

homework <- list.files('homework/week1', '*.Rmd')

exams2moodle(homework, edir = 'homework/week1', name = "week1", n=40, mchoice = list(shuffle = TRUE))

# Other quizzes below this
Quiz2 <- list( #4/5
  c("ChooseGraph1.rnw", "ChooseGraph2.rnw", # Lect 3
    "ChooseGraph3.rnw", "ChooseGraph6.rnw",
    "ChooseGraph8.rnw"), 

  c("InterpretGraph1.rnw", "InterpretGraph2.rnw", "InterpretGraph4.Rmd", "InterpretGraph3.rnw"), # OK. Lect 3

  c("Boxplot.Rmd", rep("boxplot_median_quartile_iqr.Rmd", 4)),
  
  c("Correlation1.rnw", #<< OK, lect 4?
    "Correlation3.Rmd", # OK, lect 4?
    "Correlation4.Rmd",
    "ChooseGraph9.Rmd"),
  
  c("Skewness3.rnw", "Skewness6.rnw", rep("boxplot_interpret.Rmd",4)) # OK, lecture 3
)

exams2moodle(Quiz2, edir = 'quizzes/topicA', name = "quizA2", n=40, mchoice = list(shuffle = TRUE))

Quiz3 <- list( #5/5
  c("dplyr_calc_sd.Rmd", "dplyr_calc_mean.Rmd", "dplyr_calc_quartiles.Rmd", "dplyr_calc_iqr.Rmd"), #<< TODO: REPLACE ME WITH SOMETHING DPLYR-ISH (Lect 5) (Could combine first two
  c("IQR1.rnw", "IQR2.rnw", "IQR4.Rmd"), # OK
  c("dplyr_filter_summarise.Rmd"), # OK
  c("dplyr_group_by.Rmd"), # OK
  c("dplyr_mutate.Rmd") # OK
)

exams2moodle(Quiz3, edir = 'quizzes/topicA', name = "quizA3", n=40, mchoice = list(shuffle = TRUE))

# Things not in the quiz:

# 1. Bar plots, qualitative vars etc
# 2. Reproducibility
# 3. Tidy data
# 4. Long/wide
