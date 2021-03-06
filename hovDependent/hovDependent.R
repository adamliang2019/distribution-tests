hovDependent <- function(data, groups)
{
    ## Test homogeneity of variances on several variables within a single group

    ## Load functions 
    source("./hovDependent/functions/mvt.control.R")
    source("./hovDependent/functions/commutation.R")
    source("./hovDependent/functions/Student.R")
    source("./hovDependent/functions/studentFit.R")
    dyn.load("./hovDependent/functions/studentFit", local=FALSE)

    ## Load tests
    source("./hovDependent/harris1985a.R")
    source("./hovDependent/harris1985b.R")
    source("./hovDependent/harris1985c.R")
    source("./hovDependent/harris1985d.R")
    source("./hovDependent/sandvik1982.R")

    ## Prepare data
    sf <- studentFit(data)

    ## Run each test and assemble as data frame
    output <- rbind(data.frame(),
                    harris1985a(sf),
                    harris1985b(sf),
                    harris1985c(sf),
                    harris1985d(sf))

    if (length(unique(groups)) == 1 & ncol(data) == 2) {
        output <- rbind(output,
                        sandvik1982(data))
    }

    ## Format output
    output$statistic <- round(output$statistic, 2)
    output$p.value <- round(output$p.value, 2)

    return(output)
}
