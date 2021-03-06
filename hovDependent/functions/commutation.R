commutation <-
  function(n = 2)
  {   ## returns a commutation matrix with order 'n' (only for square matrices)
    ## fast algorithm by Feng Li <Feng.Li@stat.su.se>, 2012-03-14
    n <- as.integer(n)
    sqr <- n^2
    mat <- matrix(0, nrow = sqr, ncol = sqr)
    m0 <- seq_len(sqr)
    n0 <- as.vector(t(matrix(m0, nrow = n, ncol = n)))
    ind <- cbind(m0, n0)
    dims <- c(sqr, sqr)
    indMat <- matrix(ind, ncol = length(dims))
    idx1 <- cumprod(dims[-length(dims)])
    idx2 <- indMat[, -1, drop = FALSE] - 1
    idxRaw <- rowSums(idx1 * idx2) + indMat[, 1]    
    mat[idxRaw] <- 1
    mat
  }
