function [CVM, pVal] = Cramer_Von_Mises_PVal(XX, YY)
    % Information about Bootstrap: https://towardsdatascience.com/an-introduction-to-the-bootstrap-method-58bcb51b4d60
    nboots = 1e5;
    CVM = Cramer_Von_Mises(XX,YY);
    na = length(XX);
    nb = length(YY);
    n = na + nb;
    comb = [XX;YY];

    bigger = 0;
    for ii = 1:nboots
        e = randperm(n,na);
        f = randperm(n,nb);
        boost_CVM = Cramer_Von_Mises(comb(e),comb(f));
        if boost_CVM >= CVM
            bigger = 1 + bigger;
        end
    end
    pVal = bigger/nboots;
end