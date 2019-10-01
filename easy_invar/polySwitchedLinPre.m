function [pre_s] = polySwitchedLinPre(pslsys,s)
%polyLinPre Compute the pre in the switched linear system
    % pslsys - polytopic switched linear system
    % s - set to compute pre of

poly = pslsys.X;

%compute pre under each mode and intersect
for i = 1:pslsys.ns
    mode_sys = PolyLinSys( ...
                    pslsys.A{i}, ...
                    pslsys.X, ...
                    pslsys.B{i}, ...
                    pslsys.U, ...
                    pslsys.E{i}, ...
                    pslsys.W, ...
                    pslsys.f{i} ...
               );
           
    poly = intersect(poly, polyLinPre(mode_sys, s));

end

pre_s = poly;

end

