"test.between" <-
function (data = data, test.lev, rand.unit, nperm = 100, ...) 
{
    get.g <- function(x, data, ...) {
        g.stats.glob(data.frame(x, data), ...)$g.stats
    }
    nobs <- length(rand.unit)
    perm.stat <- vector(length = nperm)
    perm.stat[nperm] <- get.g(test.lev, data, ...)
    for (i in 1:(nperm - 1)) {
        perm.stat[i] <- get.g(test.lev, data[samp.between(rand.unit), 
            ], ...)
    }
    list(g.star = perm.stat, p.val = sum(perm.stat >= perm.stat[nperm])/nperm)
}
"test.between.within" <-
function (data = data, within, test.lev, rand.unit, nperm = 100, 
    ...) 
{
    get.g <- function(x, data, ...) {
        g.stats.glob(data.frame(x, data), ...)$g.stats
    }
    nobs <- length(test.lev)
    perm.stat <- vector(length = nperm)
    perm.stat[nperm] <- get.g(test.lev, data, ...)
    for (i in 1:(nperm - 1)) {
        perm.stat[i] <- get.g(test.lev, data[samp.between.within(inner.lev = rand.unit, 
            outer.lev = within), ], ...)
    }
    list(g.star = perm.stat, p.val = sum(perm.stat >= perm.stat[nperm])/nperm)
}
"test.g" <-
function (data = data, level, nperm = 100, ...) 
{
    get.g <- function(x, data, ...) {
        g.stats.glob(data.frame(x, data), ...)$g.stats
    }
    nobs <- length(level)
    perm.stat <- vector(length = nperm)
    perm.stat[nperm] <- get.g(level, data, ...)
    for (i in 1:(nperm - 1)) {
        perm.stat[i] <- get.g(sample(level), data[, ], ...)
    }
    list(g.star = perm.stat, p.val = sum(perm.stat >= perm.stat[nperm])/nperm)
}
"test.within" <-
function (data = data, within, test.lev, nperm = 100, ...) 
{
    get.g <- function(x, data, ...) {
        g.stats.glob(data.frame(x, data), ...)$g.stats
    }
    nobs <- length(test.lev)
    perm.stat <- vector(length = nperm)
    perm.stat[nperm] <- get.g(test.lev, data, ...)
    for (i in 1:(nperm - 1)) {
        perm.stat[i] <- get.g(test.lev, data[samp.within(within), 
            ], ...)
    }
    list(g.star = perm.stat, p.val = sum(perm.stat >= perm.stat[nperm])/nperm)
}