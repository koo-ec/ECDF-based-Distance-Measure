function [KSD, pVal] = Kolmogorov_Smirnov_Dist_PVal(XX, YY)
    % Information about Bootstrap: https://towardsdatascience.com/an-introduction-to-the-bootstrap-method-58bcb51b4d60
    nboots = 1e5;
    KSD = Kolmogorov_Smirnov_Dist(XX,YY);
    na = length(XX);
    nb = length(YY);
    n = na + nb;
    comb = [XX;YY];

    bigger = 0;
    for ii = 1:nboots
        e = randperm(n,na);
        f = randperm(n,nb);
        boost_KSD = Kolmogorov_Smirnov_Dist(comb(e),comb(f));
        if boost_KSD >= KSD
            bigger = 1 + bigger;
        end
    end
    pVal = bigger/nboots;
end