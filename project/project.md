Suicide Data Analysis Project
================
Stats Stars
04/29/19

Your project goes here\! Before you submit, make sure your chunks are
turned off with `echo = FALSE`.

You can add sections as you see fit. Make sure you have a section called
Introduction at the beginning and a section called Conclusion at the
end. The rest is up to you\!

### Introduction

### Load Data and Libraries

### Suicides and Location

### Suicides and Economic Situation

![](project_files/figure-gfm/vis-suicide-gdp-per-capita-1.png)<!-- -->

### Suicides and Generation/Age

### Suicides and Year

Group number of suicides together by year to find number of suicides for
each year:

Create visualization to represent the number of suicides for each year:

![](project_files/figure-gfm/year-suicides-visualization-1.png)<!-- -->

### Suicides and Sex

Group number of suicides together by sex to find number of suicides for
each sex:

Create visualization to represent the number of suicides for each year:

![](project_files/figure-gfm/sex-suicides-visualization-1.png)<!-- -->

Compare number of suicides for each sex per year:

    ## # A tibble: 64 x 3
    ## # Groups:   year [?]
    ##     year sex        n
    ##    <dbl> <chr>  <int>
    ##  1  1985 female   288
    ##  2  1985 male     288
    ##  3  1986 female   288
    ##  4  1986 male     288
    ##  5  1987 female   324
    ##  6  1987 male     324
    ##  7  1988 female   294
    ##  8  1988 male     294
    ##  9  1989 female   312
    ## 10  1989 male     312
    ## # … with 54 more rows

![](project_files/figure-gfm/year-sex-visualization-1.png)<!-- -->

### Linear Modeling

### Conclusion
