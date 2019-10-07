function [outerInvar] = computeOuterApproxInvariant(plsys, N)
%computeOuterApproxInvariant compute an outer approximation to the maximal
%invariant set of the system
%   This is computed by iteratively intersecting the safe set with its pre
%   This method suffers from numerical instability, and is not guaranteed
%   to provide deterministic results
%
%   plsys - polytopic linear system
%   N - number of steps to perform in approximation


t = plsys.X;

for i = 1:N
    t = t & polyLinPre(plsys,t);
    t.V;
end

outerInvar = t;

end
