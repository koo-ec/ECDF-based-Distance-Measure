function [WD, pVal] = Wasserstein_Dist_PVal(XX, YY)
    % Information about Bootstrap: https://towardsdatascience.com/an-introduction-to-the-bootstrap-method-58bcb51b4d60
    nboots = 1e5;
    WD = Wasserstein_Dist(XX,YY);
    na = length(XX);
    nb = length(YY);
    n = na + nb;
    comb = [XX;YY];
    reps = 0;
    bigger = 0;
    for ii = 1:nboots
        e = randperm(n,na);
        f = randperm(n,nb);
        boost_WD = Wasserstein_Dist(comb(e),comb(f));
        if boost_WD >= WD
            bigger = 1 + bigger;
        end
    end
    pVal = bigger/nboots;
end